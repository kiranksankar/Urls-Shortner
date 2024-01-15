class FileuploadController < ApplicationController
  require 'csv'
  require 'prawn'

  def upload

    @url = Url.new

  end

  def create
    $imported_urls = []
    invalid_urls = []

    if params[:url] && params[:url][:pdf_file].present?

      uploaded_file = params[:url][:pdf_file].tempfile

      begin

        CSV.foreach(uploaded_file, headers: false) do |row|

          original_url = row[0]&.to_s&.strip

          next if original_url.blank?

          unless original_url.start_with?('http://', 'https://') && original_url =~ /\Ahttps:\/\/.+/
            invalid_urls << original_url
            next
          end


          # unless original_url.start_with?('http://', 'https://')

          #   flash[:error] = "Validation failed  '#{original_url}' must start with http:// or https://"

          #   redirect_to '/upload' and return
          # end


          shortened_url = generate_shortened_url(original_url)

          # puts(original_url)
          # puts(shortened_url)

          # Url.create!(original_url: original_url, shortened_url: shortened_url)



          new_url = current_user.urls.new(original_url: original_url, shortened_url: shortened_url)

          # unless new_url.save
          #     errors = true
          # end
          unless new_url.save
            errors = true
            # Flash the error messages
            new_url.errors.full_messages.each do |error_message|
              flash[:errors] ||= []
              flash[:errors] << error_message
            end
          end




          $imported_urls << { original_url: original_url, shortened_url: shortened_url }

        end

        if invalid_urls.any?
          flash[:error] = "Validation failed for the following URLs: #{invalid_urls.join(', ')}. They must start with http:// or https://"
          redirect_to fileshow_path and return
          # redirect_to fileshow_path(imported_urls: @imported_urls) and return
        end

        flash[:success] = 'CSV file uploaded and URLs processed successfully.'
        redirect_to fileshow_path and return
        # redirect_to fileshow_path(imported_urls: @imported_urls) and return

      rescue StandardError => e

        flash[:error] = "Please upload a CSV file "
        redirect_to "/upload"
      end

    else

      flash[:error] = 'Please select a CSV file to upload.'
      redirect_to "/upload"

    end


  end

    def new

      # @imported_urls = params[:imported_urls]

    end

    def fileshow

      @imported_urls = $imported_urls

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
      # file = $imported_urls
      # @count = 1
      # pdf = Prawn::Document.new
      # pdf.text "Users List", size: 18, style: :bold
      # pdf.move_down 10
      # pdf.text "\n"

      # file.each do |user|
      #   pdf.text "<b>Sl.no : #{@count}</b>", inline_format: true
      #   pdf.text "\n"
      #   pdf.text "<b><u>Original Url : </u></b>

      #   #{user[:original_url]}", inline_format: true
      #   pdf.text "\n"
      #   pdf.text "<b><u>Shortened Url: </u></b>

      #   #{user[:shortened_url]}", inline_format: true
      #   pdf.text "\n"
      #   @count+=1
      # end
      # send_data pdf.render, filename: "Csv_file_upload#{Date.today}.pdf", type: 'application/pdf'


  private


  def generate_shortened_url(original_url)

    random = SecureRandom.hex


    combined = original_url + random

      hash = Digest::MD5.hexdigest(combined)
      "https://shorturl-oazb.onrender.com/#{hash[0, 7]}"


    end

end
