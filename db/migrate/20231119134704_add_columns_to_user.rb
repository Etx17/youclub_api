class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
  end
end
