class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { maximum: 50 }


  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true


  validates :password, presence: true, length: { minimum: 6 }
end
