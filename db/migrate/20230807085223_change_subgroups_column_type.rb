class ChangeSubgroupsColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :sub_groups, :min_price, :integer, comment: 'Stored in cents'
    change_column :sub_groups, :max_price, :integer, comment: 'Stored in cents'
    change_column :sub_groups, :subscription_by_reccurence_price, :integer, comment: 'Stored in cents'
  end
end
