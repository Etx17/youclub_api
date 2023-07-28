class AddTarificationsToSubGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_groups, :tarifications, :text, array: true, default: []
  end
end
