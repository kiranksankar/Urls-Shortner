class Url < ApplicationRecord

  belongs_to :user

  validates :original_url, presence: true, format: { with: URI.regexp(%w[http https]), message: 'must start with http:// or https://' }
  validates :shortened_url, presence: true,  format: { with: URI.regexp(%w[http https]), message: 'must start with http:// or https://' }, uniqueness: true


# url shortened are searched to get originl url



  def self.find_by_shortened_url(shortened_url)

    find_by(shortened_url: shortened_url)

  end


end
