class AddColumnsToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :adherence_fee, :integer
  end
end
