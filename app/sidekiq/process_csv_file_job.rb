require 'csv'

class ProcessCsvFileJob
  include Sidekiq::Job

  def perform(url_file_id, job_hash)
    url_file = UrlFile.find_by(id: url_file_id)
    return unless url_file

    csv_content = url_file.pdf_file.download

    CSV.parse(csv_content, headers: false) do |row|
      original_url = row[0]&.to_s&.strip

      next if original_url.blank?

      unless original_url.start_with?('http://', 'https://')#&& original_url =~ /\Ahttp:\/\/.+/
        url_file.invalid_urls << original_url
        next
      end

      
      shortened_url = generate_shortened_url(original_url, job_hash)

      new_url = url_file.user.urls.new(original_url: original_url, shortened_url: shortened_url, short_code: job_hash)

      unless new_url.save
        new_url.errors.full_messages.each do |error_message|
          url_file.errors.add(:base, error_message)
        end
      end
    end

    url_file.save
  end

  private

  def generate_shortened_url(original_url, job_hash)
    combined = original_url + job_hash
    hash = Digest::MD5.hexdigest(combined)
    "https://shorturl-oazb.onrender.com/#{hash[0, 7]}"
  end
end
