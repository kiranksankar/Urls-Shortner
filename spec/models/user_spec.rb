require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'is valid with valid attributes' do
    user = User.new(username: 'testuser', email: 'test@example.com', password: 'Passw0rd')
    expect(user).to be_valid

  end
  it 'is not valid without a valid email format' do
  user = User.new(username: 'user', email: 'invalid_email_format', password: 'Passw0rd')
  expect(user).not_to be_valid
end

  it 'is not valid without a username' do
    user = User.new(email: 'test@example.com', password: 'Passw0rd')
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = User.new(username: 'testuser', email: 'test@example.com')
    expect(user).not_to be_valid
  end

  it 'is not valid with a password less than 6 characters' do
    user = User.new(username: 'testuser', email: 'test@example.com', password: '1234')
    expect(user).not_to be_valid
  end


  it 'can be saved with valid attributes' do
    user = User.new(username: 'testuser', email: 'test@example.com', password: 'Passw0rd')
    expect(user.save).to eq(true)
  end



end
