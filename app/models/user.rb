class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_secure_password

  validates :username, presence: true, length: { maximum: 50 }


  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # , uniqueness: true


  validates :password, presence: true, length: { minimum: 6 }

  before_create :generate_confirmation_token

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s unless self.confirmation_token.present?
  end

  def confirm_email
    self.email_confirmed = true
    self.confirmation_token = nil
    save!
  end
end
