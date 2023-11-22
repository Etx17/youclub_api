class AddCityToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :city, :string
  end
end
