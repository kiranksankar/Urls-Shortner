
class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    drop_table :registrations
    end
end
