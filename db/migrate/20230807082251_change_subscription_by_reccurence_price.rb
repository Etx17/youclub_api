class ChangeSubscriptionByReccurencePrice < ActiveRecord::Migration[7.0]
  def change
    change_column :sub_groups, :min_price, :integer, comment: 'Stored in cents'
    rename_column :sub_groups, :min_price, :min_price_cents

    change_column :sub_groups, :max_price, :integer, comment: 'Stored in cents'
    rename_column :sub_groups, :max_price, :max_price_cents

    change_column :sub_groups, :subscription_by_reccurence_price, :integer, comment: 'Stored in cents'
    rename_column :sub_groups, :subscription_by_reccurence_price, :subscription_by_recurrence_price_cents
  end
end
