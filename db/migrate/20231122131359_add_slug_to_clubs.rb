class AddSlugToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :slug, :string
    add_index :clubs, :slug, unique: true
  end
end
