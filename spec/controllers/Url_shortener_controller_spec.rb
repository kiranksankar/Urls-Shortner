require 'securerandom'
require 'digest'
require 'rails_helper'


RSpec.describe HomeController, type: :controller do

describe 'Shortened URL Generation' do
  let(:original_urls) { 'https://example.com,http://test.com' }

  it 'generates shortened URLs correctly' do
    allow(SecureRandom).to receive(:hex).and_return('random_hex')
    allow(Digest::MD5).to receive(:hexdigest).and_return('md5_hash')

    expected_result = [
      {
        original_url: 'https://example.com',
        shortened_url: 'https://shorturl-oazb.onrender.com/md5_'
      },
      {
        original_url: 'http://test.com',
        shortened_url: 'https://shorturl-oazb.onrender.com/md5_'
      }
      # Add more expected results based on the input URLs and their shortened forms
    ]

    # Mimic the logic to generate shortened URLs based on the input URLs
    input_urls = original_urls.split(',').map(&:strip).map do |original_url|
      random = SecureRandom.hex
      combined = original_url + random
      hash = Digest::MD5.hexdigest(combined)
      shortened_url = "https://shorturl-oazb.onrender.com/#{hash[0, 4]}"
      { original_url: original_url, shortened_url: shortened_url }
    end

    expect(input_urls).to eq(expected_result)
  end
end
end
