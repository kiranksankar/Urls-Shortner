Rails.application.routes.draw do

  root 'home#index'

  get '/about', to: 'home#about'

  get '/upload', to: 'fileupload#upload'
  get '/recipie' => 'home#register'

  get '/filesummary', to: 'fileupload#new'

  get '/new', to: 'urlshortener#new'

  get '/logins', to: 'login#logins'
  get '/urlshortener', to:'urlshortener#url'

  get '/show', to: 'urlshortener#show'
  get '/summary', to: 'urlshortener#index'

  get '/navbar', to: 'urlshortener#navbar'
  get '/count', to: 'home#count'

  get '/multiurls', to: 'urlshortener#multiurls'
  get '/download', to: 'urlshortener#download'

  get 'generate_pdf_summary', to: 'downloads#generate_pdf_summary'
  get '/generate_User_summary', to: 'downloads#generate_User_summary'


  get '/url_summary', to: 'usersummmary#generate_pdf_summary'
  get '/user_summary', to: 'usersummmary#generate_User_summary'





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
