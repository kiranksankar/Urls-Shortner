require 'rails_helper'

RSpec.describe HomeController, type: :controller do


  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'Root Path' do
    it 'routes to home#index' do
      expect(get: '/').to route_to('home#index')
    end
  end


  describe '/about Route' do
    it 'routes to home#about' do
      expect(get: '/about').to route_to('home#about')
    end
  end
end
