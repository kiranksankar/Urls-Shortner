FactoryBot.define do
  factory :user do
    username { 'kiranks'}
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@gmail.com" }
    password { '1234567' }
  end
end
