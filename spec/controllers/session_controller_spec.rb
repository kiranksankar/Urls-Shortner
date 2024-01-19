# spec/controllers/session_controller_spec.rb

require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  describe 'POST #create' do

    let(:user) { FactoryBot.create(:user, username: 'kiranks', email: 'test6@example.com', password: 'password', email_confirmed: true) }

    context 'with valid login credentials' do

      it 'logs in the user and redirects to /count' do
        post :create, params: { login: { email: user.email, password: 'password' } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to('/count')
      end
    end

    context 'with invalid login credentials' do
      it 'redirects to /logins ' do
        post :create, params: { login: { email: 'invalid7@example.com', password: 'wrongpassword' } }
        expect(session[:user_id]).to be_nil

        expect(response).to redirect_to('/logins')
      end
    end

    context 'when user email is not confirmed' do
      it 'redirects to /logins and displays a verification error message' do
        user_not_confirmed =  FactoryBot.create(:user, username: 'kiranks', email: 'test8@example.com', password: 'password', email_confirmed: false)
        post :create, params: { login: { email: user_not_confirmed.email, password: 'password' } }
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to('/logins')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to root path' do
      user = FactoryBot.create(:user, username: 'kiranks', email: 'test9@example.com', password: 'password', email_confirmed: true)
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(flash[:notice]).to eq('Logged out successfully')
      expect(response).to redirect_to(root_path)
    end
  end
end
