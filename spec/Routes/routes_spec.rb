require 'rails_helper'

RSpec.describe 'Routing', type: :routing do
  it 'routes root to home#index' do
    expect(get: '/').to route_to('home#index')
  end

  it 'routes GET /about to home#about' do
    expect(get: '/about').to route_to('home#about')
  end

  it 'routes GET /upload to fileupload#upload' do
    expect(get: '/upload').to route_to('fileupload#upload')
  end

  it 'routes POST /users to home#create' do
    expect(post: '/users').to route_to('home#create')
  end

  it 'routes POST /session to session#create' do
    expect(post: '/session').to route_to('session#create')
  end


  it 'routes POST /urls to urlshortener#create' do
    expect(post: '/urls').to route_to('urlshortener#create')
  end
end
