class AddShortenedUrlToUrls < ActiveRecord::Migration[7.1]
  def change
    add_column :urls, :shortened_url, :string
  end
end
