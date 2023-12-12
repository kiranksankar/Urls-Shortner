
class CreateRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :registrations do |t|
      t.string :Username
      t.string :email
      t.string :password

      t.timestamps
    end
end
end
