class FileuploadController < ApplicationController
  require 'csv'

  def upload

    @url = Url.new

  end

  def create
    @imported_urls = []

    if params[:url] && params[:url][:pdf_file].present?

      uploaded_file = params[:url][:pdf_file].tempfile

      begin

        CSV.foreach(uploaded_file, headers: false) do |row|

          original_url = row[0]&.to_s&.strip

          next if original_url.blank?


          unless original_url.start_with?('http://', 'https://')

            flash[:error] = 'Validation failed: Original URL must start with http:// or https://'

            redirect_to '/upload' and return
          end


          shortened_url = generate_shortened_url(original_url)
          puts(original_url)
          puts(shortened_url)

          Url.create!(original_url: original_url, shortened_url: shortened_url)

          @imported_urls << { original_url: original_url, shortened_url: shortened_url }

        end

        flash[:success] = 'CSV file uploaded and URLs processed successfully.'
        redirect_to filesummary_path(imported_urls: @imported_urls)

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

      @imported_urls = params[:imported_urls]

    end


  private


  def generate_shortened_url(original_url)

    random = SecureRandom.hex


    combined = original_url + random

      hash = Digest::MD5.hexdigest(combined)
      "https://shorturl-oazb.onrender.com/#{hash[0, 4]}"


    end

end
