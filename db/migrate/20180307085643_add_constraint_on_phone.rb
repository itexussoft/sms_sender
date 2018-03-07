class AddConstraintOnPhone < ActiveRecord::Migration[5.1]
  def change
    add_index :recipients, :phone, unique: true
  end
end
