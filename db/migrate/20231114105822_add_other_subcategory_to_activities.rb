class AddOtherSubcategoryToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :other_subcategory, :string
  end
end
