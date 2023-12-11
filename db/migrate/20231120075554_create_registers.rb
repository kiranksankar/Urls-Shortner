class CreateRegisters < ActiveRecord::Migration[7.1]
  def change
    drop_table :registrations
    end
  end
