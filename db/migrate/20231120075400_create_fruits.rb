class CreateFruits < ActiveRecord::Migration[7.1]
  def change
    create_table :fruits do |t|
      t.string :Username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
