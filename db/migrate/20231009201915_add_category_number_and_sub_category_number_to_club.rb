class AddCategoryNumberAndSubCategoryNumberToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :category_number, :string
    add_column :clubs, :subcategory_number, :string
    add_column :activities, :category_number, :string
    add_column :activities, :subcategory_number, :string
    add_column :clubs, :structure_type, :integer
  end
end
