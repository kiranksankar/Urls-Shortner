class FileuploadController < ApplicationController
  require 'csv'
  require 'prawn'
  require "rqrcode"

  def upload

    @url = Url.new

  end



    def create


      if params[:url] && params[:url][:pdf_file].present?
        uploaded_file = params[:url][:pdf_file]

        if uploaded_file.content_type == 'text/csv' || File.extname(uploaded_file.original_filename).downcase == '.csv'
          job_hash = SecureRandom.hex
          file_name = uploaded_file.original_filename

          url_file = current_user.url_files.new(pdf_file: uploaded_file, file_name: file_name, file_url: job_hash)

          if url_file.save
            ProcessCsvFileJob.perform_async(url_file.id, job_hash)

            if url_file.invalid_urls.present?

              flash[:errors] = 'Some URLs in the file are invalid. Please check the list of invalid URLs.'

              redirect_to upload_path
            else
              flash[:success] = 'CSV file upload queued for processing. Please refresh for loading the urls '

              redirect_to fileshow_path(url_file_id: url_file.id, job_hash: job_hash)

            end
          else
            flash[:error] = 'Error saving the file information.'
            redirect_to "/upload"
          end
        else
          flash[:error] = 'Please upload a valid CSV file.'
          redirect_to "/upload"
        end
      else
        flash[:error] = 'Please select a CSV file to upload.'
        redirect_to "/upload"
      end

    end



  # def create

  #   $imported_urls = []

  #   invalid_urls = []

  #   if params[:url] && params[:url][:pdf_file].present?

  #     uploaded_file = params[:url][:pdf_file].tempfile

  #     begin

  #       CSV.foreach(uploaded_file, headers: false) do |row|

  #         original_url = row[0]&.to_s&.strip

  #         next if original_url.blank?

  #         unless original_url.start_with?('http://', 'https://') && original_url =~ /\Ahttps:\/\/.+/
  #           invalid_urls << original_url
  #           next
  #         end




  #         shortened_url = generate_shortened_url(original_url)


  #         new_url = current_user.urls.new(original_url: original_url, shortened_url: shortened_url)

  #         unless new_url.save
  #           errors = true
  #           # Flash the error messages
  #           new_url.errors.full_messages.each do |error_message|
  #             flash[:errors] ||= []
  #             flash[:errors] << error_message
  #           end
  #         end




  #         $imported_urls << { original_url: original_url, shortened_url: shortened_url }

  #       end

  #       if invalid_urls.any?
  #         flash[:error] = "Validation failed for the following URLs: #{invalid_urls.join(', ')}. They must start with http:// or https://"
  #         redirect_to fileshow_path and return
  #         # redirect_to fileshow_path(imported_urls: @imported_urls) and return
  #       end

  #       flash[:success] = 'CSV file uploaded and URLs processed successfully.'
  #       redirect_to fileshow_path and return
  #       # redirect_to fileshow_path(imported_urls: @imported_urls) and return

  #     rescue StandardError => e

  #       flash[:error] = "Please upload a CSV file "
  #       redirect_to "/upload"
  #     end

  #   else

  #     flash[:error] = 'Please select a CSV file to upload.'
  #     redirect_to "/upload"

  #   end


  # end

    def new

      # @imported_urls = params[:imported_urls]

    end

    def fileshow
      url_file_id = params[:url_file_id]
      job_hash = params[:job_hash]


      puts"====================================="



      puts url_file_id
      puts job_hash

      puts"====================================="

      @url_file = UrlFile.find_by(id: url_file_id, file_url: job_hash)



      puts "============================================"

      puts @url_file.invalid_urls

      puts "============================================"


      # if @url_file
        $imported_urls = @url_file.user.urls.where(short_code: job_hash)
        @imported_urls = $imported_urls
        # ... other necessary code
      # else
        # Handle the case where @url_file is not found
      # end
    end

    def csvfileupload_download


      @user = User.all

      pdf = Prawn::Document.new
      pdf.text "Csv upload List", size: 18, style: :bold
      pdf.move_down 10


      data = $imported_urls.map.with_index do |user, index|
        [index + 1, user[:original_url],user[:shortened_url]]

      end

      pdf.table( [['sl.no', 'Original url', 'Shortened Url']] + data, header: true, column_widths: { 0 => 40, 1 => 250, 2 => 250 }) do |table|


        data.length.times do |i|
          table.row(i).style(background_color: (i.even? ? 'DDDDDD' : 'FFFFFF'))
        end
        table.column(0).style(align: :center)
        table.column(1).style(align: :left)
        table.column(2).style(align: :left)
      end

      send_data pdf.render, filename: "Csv_upload_List#{Date.today}.pdf", type: 'application/pdf'

    end


    def qrcode_generate



      original_urls = params[:original_url]



      original_urls.strip!

      random = SecureRandom.hex

      combined = original_urls + random

      hash = Digest::MD5.hexdigest(combined)


      shortened_url = "https://shorturl-oazb.onrender.com/#{hash[0, 7]}"

      { original_url: original_urls, shortened_url: shortened_url }




  if original_urls.empty?


    flash[:error] = 'No URLs provided'

    redirect_to '/qrcode'

  else

  errors = false


  if original_urls.present?

    unless original_urls.start_with?('http://', 'https://') && original_urls =~ /\Ahttps:\/\/.+/

      errors = true
    end

    new_url = current_user.urls.new(original_url: original_urls, shortened_url: shortened_url)

    errors = true unless new_url.save
  end

  if errors

    flash[:error] = 'All URLs must start with or https://'
    redirect_to '/qrcode'

  else

    flash[:success] = 'All URLs were successfully saved'
    redirect_to qrcodeshow_path(input_urls: new_url)

  end
end


  end

  def qrcode


  end

  def qrcodeshow

    original_url = params[:input_urls]

    puts"=================================================="

    @url = Url.find_by(id: original_url)

    @shortened_url = @url.shortened_url

    puts"=================================================="

    qrcode = RQRCode::QRCode.new(@shortened_url)

    @png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
    )



    puts @url.shortened_url

  end



  # private


  # def generate_shortened_url(original_url)

  #   random = SecureRandom.hex


  #   combined = original_url + random

  #     hash = Digest::MD5.hexdigest(combined)
  #     "https://shorturl-oazb.onrender.com/#{hash[0, 7]}"


  #   end

  #   def user_params
  #     params.require(:url).permit(:original_url, :shortened_url)
  #   end


end
