class AddIsPremiumToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :is_premium, :boolean, default: false
  end
end
