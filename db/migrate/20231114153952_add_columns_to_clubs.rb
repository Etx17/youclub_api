class AddColumnsToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :inscription_open_all_year, :boolean, default: true
    add_column :clubs, :inscription_start_date, :date
    add_column :clubs, :inscription_end_date, :date
  end
end
