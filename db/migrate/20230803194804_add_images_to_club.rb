class AddImagesToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :images, :string, array: true, default: []
  end
end
