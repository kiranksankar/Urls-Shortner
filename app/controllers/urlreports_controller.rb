class UrlreportsController < ApplicationController

  def summary

  end


  def details



    @user = current_user

    @urls = @user.urls


    count = @urls.count

    @first = @urls.order(:created_at).first&.original_url

    @last  =  @urls.order(:created_at).last&.original_url

    @urls_counts = @urls.group(:original_url).count

    @most_used = @urls_counts.key(@urls_counts.values.max)

    @most_count = @urls_counts[@most_used]



    @least_used = @urls_counts.key(@urls_counts.values.min)

    @least_count = @urls_counts[@least_used]


  #  puts(@most_used)

  #  puts(@most_count)

  #  puts(@least_count)

  #  puts(@least_used)

  #  puts("8888888888888888888888888888888888888888")

  #   puts(@urls_counts)

  #   puts(@first)
  #   puts(@last)


  end




  def dowload_details



    user = current_user

    urls = user.urls

    count = urls.count

    first = urls.order(:created_at).first&.original_url

    last  =  urls.order(:created_at).last&.original_url

    urls_counts = urls.group(:original_url).count

    most_used = urls_counts.key(urls_counts.values.max)

    most_count = urls_counts[most_used]



    least_used = urls_counts.key(urls_counts.values.min)

    least_count = urls_counts[least_used]


    pdf = Prawn::Document.new
    pdf.text "Detailed Report", size: 18, style: :bold
    pdf.move_down 10
    pdf.text "\n"

      pdf.text "<b><u>User Id : </u></b>

      #{user.id}", inline_format: true
      pdf.text "\n"

      pdf.text "<b><u>User Name : </u></b>

      #{user.username}", inline_format: true
      pdf.text "\n"
      pdf.text "<b><u>User Email: </u></b>

      #{user.email}", inline_format: true
      pdf.text "\n"

      pdf.text "<b><u>Total Url Shortened : </u></b>

      #{count}", inline_format: true
      pdf.text "\n"
      pdf.text "<b><u>First Url Shortened: </u></b>

      #{first}", inline_format: true
      pdf.text "\n"

      pdf.text "<b><u>Last Url Shortened: </u></b>

      #{last}", inline_format: true
      pdf.text "\n"

      pdf.text "<b><u>Most Shortened Url: </u></b>

      #{most_used} , count (#{most_count})", inline_format: true
      pdf.text "\n"


      pdf.text "<b><u>Least Shortened Url: </u></b>

      #{least_used} , count (#{least_count})", inline_format: true
      pdf.text "\n"

    send_data pdf.render, filename: "details report#{Date.today}.pdf", type: 'application/pdf'
  end


end
