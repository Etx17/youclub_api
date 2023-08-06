class AddImagesToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :images, :string, array: true, default: []
  end
end
