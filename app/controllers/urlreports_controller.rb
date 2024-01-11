class UrlreportsController < ApplicationController
  require 'will_paginate/array'


  def summary



    @user = current_user

    @urls = @user.urls

    @urls_counts = @urls.group(:original_url).count

    @most_used = @urls_counts.key(@urls_counts.values.max)

    @most_count = @urls_counts[@most_used]

    matching_urls = Url.where(original_url: @most_used)


    @short_urls = matching_urls.pluck(:shortened_url, :created_at)

    @url_data = @short_urls.map { |url, created_at| url }
    @created_at_times = @short_urls.map { |url, created_at| created_at }



    # @urls_paginate = WillPaginate::Collection.create(params[:page] || 1, 5, @short_urls.length) do |pager|
    #   pager.replace(@short_urls[pager.offset, pager.per_page].to_a)
    # end


    puts("-----------------------------------------------")
    puts (@short_urls)
    puts(".......,-------------------------------------")


    @least_used = @urls_counts.key(@urls_counts.values.min)

    @least_count = @urls_counts[@least_used]

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


   puts(@most_used)

   puts(@most_count)

   puts(@least_count)

   puts(@least_used)

   puts("8888888888888888888888888888888888888888")

    puts(@urls_counts)

    puts(@first)
    puts(@last)


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




  def most_used_url_details

    @user = current_user

    @urls = @user.urls

    @urls_counts = @urls.group(:original_url).count

    @most_used = @urls_counts.key(@urls_counts.values.max)

    @most_count = @urls_counts[@most_used]

    matching_urls = Url.where(original_url: @most_used)


    @short_urls = matching_urls.pluck(:shortened_url)

    @short_urls = matching_urls.pluck(:shortened_url, :created_at)

    # @url_data = @short_urls.map { |url, created_at| url }
    # @created_at_times = @short_urls.map { |url, created_at| created_at }



    @count = 1
    pdf = Prawn::Document.new
    pdf.text "Most Shortened Url : #{@most_used}", size: 18, style: :bold
    pdf.move_down 10

    pdf.text " <u>Shortened Url created each time :</u>", size: 18, style: :bold , inline_format: true

    @short_urls.each do |url, created_at|

      pdf.text "<b> No.: #{@count} </b>", inline_format: true
      pdf.text "\n"
      pdf.text "\n"

      pdf.text " created at : #{created_at}", inline_format: true

      pdf.text "\n"

      pdf.text "#{url}", inline_format: true
      pdf.text "\n"
      @count+=1
    end

    send_data pdf.render, filename: "Most_used_urls#{Date.today}.pdf", type: 'application/pdf'

  end

end
