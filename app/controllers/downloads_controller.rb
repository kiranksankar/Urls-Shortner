class DownloadsController < ApplicationController

  require 'prawn'

  def generate_pdf_summary


    @user = current_user
    @urls = @user.urls

    # @urls = Url.all
    @count = 1
    pdf = Prawn::Document.new
    pdf.text "URL Shortener Report", size: 18, style: :bold
    pdf.move_down 10

    @urls.each do |url|

      pdf.text "<b> Sl.no : #{@count} </b>", inline_format: true
      pdf.text "\n"
      pdf.text  "<b><u>Original URL:</b></u>

      #{url.original_url}", inline_format: true
      pdf.text "\n"
      pdf.text "<b><u>Shortened URL:</b> </u>

      #{url.shortened_url}", inline_format: true
      pdf.text "\n"
      @count+=1
    end

    send_data pdf.render, filename: "url_shortener_summary_#{Date.today}.pdf", type: 'application/pdf'
  end


    def generate_User_summary
      @user = User.all
      @count = 1
      pdf = Prawn::Document.new
      pdf.text "Users List", size: 18, style: :bold
      pdf.move_down 10

      pdf.text "\n"

      @user.each do |user|
        pdf.text "<b> Sl.no : </b>#{@count}", inline_format: true
        pdf.text "\n"
        pdf.text "<b><u> Username of Users:  </u></b>

        #{user.username}", inline_format: true
        pdf.text "\n"
        pdf.text "<b> <u>Email used by User:  </u> </b>

        #{user.email}", inline_format: true
        pdf.text "\n"
        @count+=1
      end
      send_data pdf.render, filename: "User_summary_#{Date.today}.pdf", type: 'application/pdf'

      end



end
