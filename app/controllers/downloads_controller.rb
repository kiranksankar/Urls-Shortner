class DownloadsController < ApplicationController

  require 'prawn'

  def generate_pdf_summary


    @user = current_user
@urls = @user.urls

pdf = Prawn::Document.new
pdf.text "URL Shortener Report", size: 18, style: :bold
pdf.move_down 10

data = @urls.map.with_index do |url, index|
  [index + 1, url.original_url, url.shortened_url]
end

pdf.table([['sl.no', 'Original url', 'Shortened Url']] + data, header: true, column_widths: { 0 => 40, 1 => 250, 2 => 250 }) do |table|
  data.length.times do |i|
    table.row(i).style(background_color: (i.even? ? 'DDDDDD' : 'FFFFFF'))
  end
  table.column(0).style(align: :center)
  table.column(1).style(align: :left)
  table.column(2).style(align: :left)
end


send_data pdf.render, filename: "url_shortener_summary_#{Date.today}.pdf", type: 'application/pdf'

end


    def generate_User_summary


      @user = User.all

      pdf = Prawn::Document.new
      pdf.text "Users List", size: 18, style: :bold
      pdf.move_down 10


      data = @user.map.with_index do |user|
        [user.id, user.username,user.email]
      end

      pdf.table([['User id', 'Usr Name', 'User email']] + data, header: true, column_widths: { 0 => 60, 1 => 240, 2 => 240 }) do |table|
        data.length.times do |i|
          table.row(i).style(background_color: (i.even? ? 'DDDDDD' : 'FFFFFF'))
        end
        table.column(0).style(align: :center)
        table.column(1).style(align: :left)
        table.column(2).style(align: :left)
      end

      send_data pdf.render, filename: "User_summary_#{Date.today}.pdf", type: 'application/pdf'

      end



end
