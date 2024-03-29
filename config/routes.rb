Rails.application.routes.draw do


  root 'home#index'

  get '/about', to: 'home#about'

  get '/register' => 'home#register'

  get '/confirm_email', to: 'home#confirm_email', as: 'confirm_email'

  get '/logins', to: 'login#logins'

  get '/forgotpassword', to: 'login#edit'

  get '/token_confirm', to: 'login#tocken_confirm'

  get '/password', to: 'login#password', as: 'password'

  get "/logout", to: 'session#destroy'



  get '/qrcode' => 'fileupload#qrcode'

  get 'qrcodeshow' => 'fileupload#qrcodeshow'


  get '/upload', to: 'fileupload#upload'



  get '/filesummary', to: 'fileupload#new'

  get '/fileshow/:url_file_id/:job_hash', to: 'fileupload#fileshow', as: 'fileshow'

  get '/new', to: 'urlshortener#new'


  get '/urlshortener', to:'urlshortener#url'

  get '/show', to: 'urlshortener#show'


  get '/urlslist', to: 'urlshortener#index'

  # get '/userlist', to: 'urlshortener#userlist'


  get '/navbar1', to: 'home#navbar'

  get '/navbar', to: 'urlshortener#navbar'
  get '/count', to: 'home#count'

  get '/multiurls', to: 'urlshortener#multiurls'
  get '/download', to: 'urlshortener#download'




  get '/upload_download', to: 'fileupload#csvfileupload_download'
  get 'generate_pdf_summary', to: 'downloads#generate_pdf_summary'
  # get '/generate_User_summary', to: 'downloads#generate_User_summary'









  get '/most_used_url_details' => 'urlreports#most_used_url_details'


  get '/summary_details' => 'urlreports#summary_details'



  get '/details', to: 'urlreports#details'
  get '/urlsummary', to: 'urlreports#summary'


  get '/dowload_details', to: 'urlreports#dowload_details'



  # get '/:password', to: 'login#password'





  # get '/url_summary', to: 'usersummmary#generate_pdf_summary'
  # get '/user_summary', to: 'usersummmary#generate_User_summary'
  #
  #

  get '/:shortened_url', to: 'urlshortener#redirect', as: 'redirect'




  post '/delete' => 'urlshortener#delete'

  post 'qrcode_generate' => 'fileupload#qrcode_generate'

  post '/password_reset', to: 'login#password_reset'

  post '/confirmtoken', to: 'login#confirmtoken'

  post '/verifyemail', to: 'login#verifyemail'

  post '/users' => 'home#create'

  post '/session' => 'session#create'

  post '/urls' => 'urlshortener#create'

  post '/pdfcreate' => 'urlshortener#pdfcreate'

  post '/create' => 'fileupload#create'


  get "up" => "rails/health#show", as: :rails_health_check
end


  # get 'downloads/summary_report', to: 'downloads#summary_report', as: :downloads_summary_report
  # delete '/logout', to: 'sessions#destroy'

  # resources :urlshortener doyellow
  #   collection do
  #     get 'generate_pdf_summary'
  #   end
  # end



  # get '/:shortened_url', to: 'urlshortener#redirect_original_url', as: 'redirect_original'
