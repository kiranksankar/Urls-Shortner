class DownloadsController < ApplicationController

  require 'prawn'

  def generate_pdf_summary
    @urls = Url.all
    @count = 1
    pdf = Prawn::Document.new
    pdf.text "URL Shortener Report"

    @urls.each do |url|

      pdf.text "Sl.no : #{@count}"   "\n"
      pdf.text  "Original URL: #{url.original_url}"
      pdf.text "\n"
      pdf.text "Shortened URL: #{url.shortened_url}"
      pdf.text "\n"
      @count+=1
    end

    send_data pdf.render, filename: "url_shortener_summary_#{Date.today}.pdf", type: 'application/pdf'
  end


    def generate_User_summary
      @user = User.all
      @count = 1
      pdf = Prawn::Document.new
      pdf.text "Users List"
      pdf.text "\n"

      @user.each do |user|
        pdf.text "Sl.no : #{@count}"
        pdf.text "\n"
        pdf.text "Username of Users: #{user.username}"
        pdf.text "\n"
        pdf.text "Email used by User:  #{user.email}"
        pdf.text "\n"
        @count+=1
      end
      send_data pdf.render, filename: "User_summary_#{Date.today}.pdf", type: 'application/pdf'

      end


end
