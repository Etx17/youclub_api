class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :rna_number
      t.string :geo_point
      t.string :category
      t.string :address
      t.string :actual_zipcode
      t.string :subcategory
      t.string :nearbyStation
      t.string :website
      t.text :objet
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
