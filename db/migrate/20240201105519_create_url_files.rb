class CreateUrlFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :url_files1 do |t|
      t.references :user, null: false, foreign_key: true
      t.string :file_name
      t.string :file_url
      t.jsonb :imported_urls
      t.jsonb :invalid_urls
      t.jsonb :error_messages

      t.timestamps
    end
  end
end
