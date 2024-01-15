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


    data = [
      ["User Id", user.id ],
      ["User Name", user.username],
      ["User Email", user.email],
      ["Total Url Shortened", count],
      ["First Url Shortened", first],
      ["Last Url Shortened", last],
      ["Most Shortened Url", "#{most_used}, count (#{most_count})"],
      ["Least Shortened Url", "#{least_used}, count (#{least_count})"]
    ]

    pdf.table(data, header: true) do |table|
      data.length.times do |i|
        table.row(i).style(background_color: (i.even? ? 'DDDDDD' : 'FFFFFF'))
      end
    end

    send_data pdf.render, filename: "details_report_#{Date.today}.pdf", type: 'application/pdf'

  end




  def most_used_url_details

    @user = current_user
    @urls = @user.urls
    @urls_counts = @urls.group(:original_url).count
    @most_used = @urls_counts.key(@urls_counts.values.max)
    @most_count = @urls_counts[@most_used]
    matching_urls = Url.where(original_url: @most_used)

## create short url and created at data in separate arryas
#
#
    @short_urls = matching_urls.pluck(:shortened_url)

    pdf = Prawn::Document.new


    created_at_data = matching_urls.pluck(:created_at).map(&:to_s)

    # Combine the data for the table
    data = @short_urls.zip(created_at_data).map.with_index do |(url, created_at), index|
      [index + 1, url.to_s, created_at]

    end

    pdf.table( [['sl.no','Shortened Url', 'Created at']] + data, column_widths: { 0 => 50, 1 => 300, 2 => 150 }) do |table|
      data.length.times do |i|
        table.row(i).style(background_color: (i.even? ? 'DDDDDD' : 'FFFFFF'))
      end
      table.column(0).style(align: :center)
      table.column(1).style(align: :left)
      table.column(2).style(align: :center)
    end

    send_data pdf.render, filename: "Most_used_urls#{Date.today}.pdf", type: 'application/pdf'
  end



  def summary_details

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


    # @user = current_user
    # @urls = @user.urls
    # @urls_counts = @urls.group(:original_url).count
    # @most_used = @urls_counts.key(@urls_counts.values.max)
    # @most_count = @urls_counts[@most_used]
    matching_urls = Url.where(original_url: most_used)

## create short url and created at data in separate arryas
#
#
    @short_urls = matching_urls.pluck(:shortened_url)




    pdf = Prawn::Document.new


    pdf.text "<u>Detailed Report</u>", inline_format: true, size: 18, style: :bold
    pdf.move_down 40


    data = [
      ["User Id", user.id ],
      ["User Name", user.username],
      ["User Email", user.email],
      ["Total Url Shortened", count],
      # ["First Url Shortened", first],
      ["Last Url Shortened", last],
      ["Most Shortened Url", "#{most_used}, count (#{most_count})"],
      ["Least Shortened Url", "#{least_used}, count (#{least_count})"]
    ]

    pdf.table(data, header: true) do |table|

      data.length.times do |i|
        table.row(i).style(background_color: (i.even? ? 'DDDDDD' : 'FFFFFF'))
      end
    end


    pdf.move_down 40

    pdf.text "<u>First Url Shortened </u>", inline_format: true, size: 18, style: :bold

    pdf.move_down 10

    pdf.text "#{first}"

    pdf.move_down 40

    pdf.text "<u>Last Url Shortened </u>", inline_format: true, size: 18, style: :bold

    pdf.move_down 10

    pdf.text "#{last}"

    created_at_data = matching_urls.pluck(:created_at).map(&:to_s)

    # Combine the data for the table
    data = @short_urls.zip(created_at_data).map.with_index do |(url, created_at), index|
      [index + 1, url.to_s, created_at]

    end


    pdf.move_down 40

    pdf.text "<u>Most Shortened URL</u>", inline_format: true, size: 18, style: :bold
    pdf.move_down 10

    pdf.text "#{most_used }"

    pdf.move_down 30

    pdf.table( [['sl.no', 'Shortened Url', 'Created at']] + data, column_widths: { 0 => 50, 1 => 300, 2 => 150 }) do |table|
      data.length.times do |i|
        table.row(i).style(background_color: (i.even? ? 'DDDDDD' : 'FFFFFF'))
      end
      table.column(0).style(align: :center)
      table.column(1).style(align: :left)
      table.column(2).style(align: :center)
    end

    pdf.move_down 40

    pdf.text "<u>Least Shortened Url </u>", inline_format: true, size: 18, style: :bold

    pdf.move_down 10

    pdf.text "#{least_used}"

    send_data pdf.render, filename: "Summary_report#{Date.today}.pdf", type: 'application/pdf'



  end

end











    # pdf = Prawn::Document.new
    # pdf.text "Detailed Report", size: 18, style: :bold
    # pdf.move_down 10
    # pdf.text "\n"

    #   pdf.text "<b><u>User Id : </u></b>

    #   #{user.id}", inline_format: true
    #   pdf.text "\n"

    #   pdf.text "<b><u>User Name : </u></b>

    #   #{user.username}", inline_format: true
    #   pdf.text "\n"
    #   pdf.text "<b><u>User Email: </u></b>

    #   #{user.email}", inline_format: true
    #   pdf.text "\n"

    #   pdf.text "<b><u>Total Url Shortened : </u></b>

    #   #{count}", inline_format: true
    #   pdf.text "\n"
    #   pdf.text "<b><u>First Url Shortened: </u></b>

    #   #{first}", inline_format: true
    #   pdf.text "\n"

    #   pdf.text "<b><u>Last Url Shortened: </u></b>

    #   #{last}", inline_format: true
    #   pdf.text "\n"

    #   pdf.text "<b><u>Most Shortened Url: </u></b>

    #   #{most_used} , count (#{most_count})", inline_format: true
    #   pdf.text "\n"


    #   pdf.text "<b><u>Least Shortened Url: </u></b>

    #   #{least_used} , count (#{least_count})", inline_format: true
    #   pdf.text "\n"

    # send_data pdf.render, filename: "details report#{Date.today}.pdf", type: 'application/pdf'





  # def most_used_url_details

  #   @user = current_user

  #   @urls = @user.urls

  #   @urls_counts = @urls.group(:original_url).count

  #   @most_used = @urls_counts.key(@urls_counts.values.max)

  #   @most_count = @urls_counts[@most_used]

  #   matching_urls = Url.where(original_url: @most_used)


  #   @short_urls = matching_urls.pluck(:shortened_url)

  #   @short_urls = matching_urls.pluck(:shortened_url, :created_at)

  #   # @url_data = @short_urls.map { |url, created_at| url }
  #   # @created_at_times = @short_urls.map { |url, created_at| created_at }



  #   @count = 1
  #   pdf = Prawn::Document.new
  #   pdf.text "Most Shortened Url : #{@most_used}", size: 18, style: :bold
  #   pdf.move_down 10

  #   pdf.text " <u>Shortened Url created each time :</u>", size: 18, style: :bold , inline_format: true



  #   @short_urls.each do |url, created_at|

  #     pdf.text "<b> No.: #{@count} </b>", inline_format: true
  #     pdf.text "\n"
  #     pdf.text "\n"

  #     pdf.text " created at : #{created_at}", inline_format: true

  #     pdf.text "\n"

  #     pdf.text "#{url}", inline_format: true
  #     pdf.text "\n"
  #     @count+=1
  #   end

  #   send_data pdf.render, filename: "Most_used_urls#{Date.today}.pdf", type: 'application/pdf'

  # end
