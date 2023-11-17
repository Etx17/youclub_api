class AddCalledToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :called, :boolean, default: false
  end
end
