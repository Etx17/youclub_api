class AddCompetitiveToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :competitive, :boolean, default: false
  end
end
