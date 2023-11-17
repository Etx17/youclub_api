class RemoveIsPremiumFromClubs < ActiveRecord::Migration[7.0]
  def change
    remove_column :clubs, :is_premium, :boolean
  end
end
