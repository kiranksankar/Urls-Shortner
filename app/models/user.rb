class User < ApplicationRecord

  has_many :urls, dependent: :destroy
  has_many :url_files

  has_secure_password

  validates :username, presence: true, length: { maximum: 50 }


  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } , uniqueness: true


  validates :password, presence: true, length: { minimum: 6 }

  before_create :generate_confirmation_token


  def generate_confirmation_token

    self.confirmation_token = SecureRandom.hex(5) unless self.confirmation_token.present?

  end


  def generate_password_reset_token
    token = SecureRandom.hex(4)
    $global_password_reset_token = token

    token
  end


end
