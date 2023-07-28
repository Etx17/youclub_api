class CreateSubGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_groups do |t|
      t.references :activity, null: false, foreign_key: true
      t.string :name
      t.decimal :min_price
      t.decimal :max_price
      t.string :recurrence
      t.string :type
      t.text :short_description
      t.decimal :subscription_by_reccurence_price

      t.timestamps
    end
  end
end
