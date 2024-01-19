# spec/controllers/application_controller_spec.rb

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render plain: 'URl shortener'
    end
  end

  describe '#current_user' do
    it 'returns the current user if session user_id is present' do

      user = FactoryBot.create(:user, username: 'kiranks', email: 'tarwaVest@example.com', password: 'password', confirmation_token: 'ee3a013ea1', email_confirmed: true)

      session[:user_id] = user.id
      get :index
      expect(controller.current_user).to eq(user)
    end

    it 'returns nil if session user_id is not present' do
      session[:user_id] = nil
      get :index
      expect(controller.current_user).to be_nil
    end
  end
end
