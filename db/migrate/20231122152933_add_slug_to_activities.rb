class AddSlugToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :slug, :string
    add_index :activities, :slug, unique: true
  end
end
