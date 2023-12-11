

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'authentication' do
    it 'authenticates user with valid credentials' do
      # params.require(:user).permit(:username, :email, :password, :password_confirmation)


      user = FactoryBot.create(:user, username: 'kiranks', email: 'test@example.com', password: 'password')

      login_user = User.find_by(email: 'test@example.com').authenticate('password')

      expect(login_user).to eq(user)
    end

    it 'does not authenticate user with invalid credentials' do
      FactoryBot.create(:user, email: 'test@example.com', password: 'password')

      authenticated_user = User.find_by(email: 'test@example.com').authenticate('wrong_password')

      expect(authenticated_user).to be false
    end
  end
end
