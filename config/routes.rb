Rails.application.routes.draw do


  root 'home#index'

  get '/about', to: 'home#about'

  get '/recipie' => 'home#register'

  get '/confirm_email', to: 'home#confirm_email', as: 'confirm_email'

  get '/logins', to: 'login#logins'

  get '/forgotpassword', to: 'login#edit'

  get "/logout", to: 'session#destroy'



  get '/upload', to: 'fileupload#upload'



  get '/filesummary', to: 'fileupload#new'

  get '/fileshow', to: 'fileupload#fileshow'

  get '/new', to: 'urlshortener#new'


  get '/urlshortener', to:'urlshortener#url'

  get '/show', to: 'urlshortener#show'


  get '/urlslist', to: 'urlshortener#index'

  get '/userlist', to: 'urlshortener#userlist'


  get '/navbar1', to: 'home#navbar'

  get '/navbar', to: 'urlshortener#navbar'
  get '/count', to: 'home#count'

  get '/multiurls', to: 'urlshortener#multiurls'
  get '/download', to: 'urlshortener#download'

  get 'generate_pdf_summary', to: 'downloads#generate_pdf_summary'
  get '/generate_User_summary', to: 'downloads#generate_User_summary'

  get '/token_confirm', to: 'login#tocken_confirm'

  # get '/:password', to: 'login#password'
  get '/password', to: 'login#password', as: 'password'




  get '/url_summary', to: 'usersummmary#generate_pdf_summary'
  get '/user_summary', to: 'usersummmary#generate_User_summary'

  get '/:shortened_url', to: 'urlshortener#redirect', as: 'redirect'






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

  # resources :urlshortener do
  #   collection do
  #     get 'generate_pdf_summary'
  #   end
  # end



  # get '/:shortened_url', to: 'urlshortener#redirect_original_url', as: 'redirect_original'
