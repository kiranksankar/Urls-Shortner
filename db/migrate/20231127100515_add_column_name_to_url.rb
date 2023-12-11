class AddColumnNameToUrl < ActiveRecord::Migration[7.1]
  def change
    add_column :urls, :original_url, :string
  end
end
