class RenameTypeToClassTypeInSubGroups < ActiveRecord::Migration[7.0]
  def change
    rename_column :sub_groups, :type, :class_type
  end
end
