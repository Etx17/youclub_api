class RemoveTarificationsFromSubgroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :sub_groups, :tarifications
  end
end
