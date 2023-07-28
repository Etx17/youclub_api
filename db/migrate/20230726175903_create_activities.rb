class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :geo_point
      t.string :category
      t.string :address
      t.string :actual_zipcode
      t.boolean :free_trial
      t.boolean :is_looking_for_volunteer
      t.string :subcategories
      t.string :recurrence
      t.string :subscription_link
      t.text :short_description
      t.text :full_description
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
