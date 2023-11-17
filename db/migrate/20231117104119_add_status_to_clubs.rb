class AddStatusToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :status, :integer, default: 0
  end
end
