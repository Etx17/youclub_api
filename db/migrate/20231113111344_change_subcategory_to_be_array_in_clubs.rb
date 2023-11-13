class ChangeSubcategoryToBeArrayInClubs < ActiveRecord::Migration[7.0]
  def change
    change_column :clubs, :subcategory, :string, array: true, default: [], using: '(string_to_array(subcategory, \',\'))'
    rename_column :clubs, :subcategory, :subcategories

    change_column :clubs, :subcategory_number, :string, array: true, default: [], using: '(string_to_array(subcategory_number, \',\'))'
    rename_column :clubs, :subcategory_number, :subcategories_number
  end
end
