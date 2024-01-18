class UrlshortenerController < ApplicationController

  require 'will_paginate/array'

  def url


    @url = Url.new

  end

  def create

  original_urls = params[:url][:original_url].split(',')

   @input_urls = original_urls.map do |original_url|

    original_url.strip!

    random = SecureRandom.hex


    combined = original_url + random

    hash = Digest::MD5.hexdigest(combined)

    shortened_url = "https://shorturl-oazb.onrender.com/#{hash[0, 7]}"

    { original_url: original_url, shortened_url: shortened_url }



  end

  if @input_urls.empty?
    flash[:url_error] = ['No URLs provided']
    redirect_to '/upload'
  else

  errors = false


  @input_urls.each do |url|

    unless url[:original_url].start_with?('http://', 'https://')  && url[:original_url] =~ /\Ahttps:\/\/.+/
      errors = true
      break
    end

    new_url = current_user.urls.new(original_url: url[:original_url], shortened_url: url[:shortened_url])

    errors = true unless new_url.save
  end

  if errors

    flash[:url_error] = ['All URLs must start with http:// or https://']
    redirect_to '/upload'

  else

    flash[:success] = 'All URLs were successfully saved'


    redirect_to multiurls_path(input_urls: @input_urls)

  end
end

end



def redirect
    hash = params[:shortened_url]
    puts(hash)
    @url = Url.find_by(shortened_url: "https://shorturl-oazb.onrender.com/#{hash}")


    if @url
      original = @url.original_url
      response.headers['Location'] = original
      render plain: 'Redirecting..........', status: :found
      # allow_other_host: true
    else

      render plain: 'Shortened URL not found', status: :not_found
      redirect_to root_path
    end
  end



  def multiurls

    @input_urls = params[:input_urls]

  end

  def show

    @latest_url = Url.last
    @shortened_url = @latest_url.shortened_url if @latest_url

  end


  def index

    # @summary = Url.all
    @user = current_user
    # @user_urls = @user.urls
    @user_urls = @user.urls.paginate(page: params[:page], per_page: 20)
    @summary = @user_urls

  end

  def navbar

  end

  def userlist

    @user = User.all

  end


  def delete



    url = params[:url]

    url_id = url.to_i if url.present?


    delete_url = Url.find_by(id: url_id)

    if delete_url

      delete_url.destroy

      redirect_to urlslist_path, notice: 'URL was successfully deleted.'

    else

      redirect_to urlslist_path, alert: 'URL not found.'
      
    end

  end




  private



  def user_params
    params.require(:url).permit(:original_url, :shortened_url)
  end
end



#create a single shorten


  # def create
  #   original_url = params[:url][:original_url]


  #   hash = Digest::MD5.hexdigest(original_url)


  #   shortened_url = "http://test.tin.ee/#{hash[0, 7]}"




  #   urls = Url.new(user_params)
  #   urls.shortened_url = shortened_url
  #   if urls.save
  #     redirect_to '/show'
  #   else

  #     flash[:url_error] = ['must start with https:// or https://']
  #     redirect_to '/urlshortener'
  #   end
  # end
  #
  #
  #
  #
# redirect the url to original
#
#
  #  def redirect_original_url
  #   shortened_url = params[:shortened_url]
  #   original_url = Url.find_original_url(shortened_url)

  #   if original_url
  #     redirect_to original_url
  #   else
  #     # Handle the case when the shortened URL doesn't exist
  #     flash[:error] = 'Shortened URL not found'
  #     redirect_to root_path # or wherever you want to redirect if the URL isn't found
  #   end
  # end




   # def generate_shortened_url(original_url)
  #   hash = Digest::MD5.hexdigest(original_url)
  #   "http://example.com/#{hash[0, 7]}" # Modify the URL structure as needed
  # end
