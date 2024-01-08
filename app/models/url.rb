class Url < ApplicationRecord

  belongs_to :user

  validates :original_url, presence: true, format: { with: URI.regexp(%w[http https]), message: 'must start with http:// or https://' }
  validates :shortened_url, presence: true,  format: { with: URI.regexp(%w[http https]), message: 'must start with http:// or https://' }, uniqueness: true
  # uniqueness: true,

# url shortened are searched to get originl url



  def self.find_by_shortened_url(shortened_url)

    find_by(shortened_url: shortened_url)

  end

  # before_validation :normalize_url

  # Add the shortened_url field to the model
  # attr_accessible :original_url, :shortened_url
  # before_validation :normalize_url

  # private

  # def normalize_url
  #   return if original_url.blank?

  #   # Ensure the URL has a scheme (http:// or https://) if not provided
  #   self.original_url = "http://#{original_url}" unless original_url.match?(/\Ahttp(s)?:\/\//)
  # end
end
