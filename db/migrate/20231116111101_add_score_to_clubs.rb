class AddScoreToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :score, :integer
  end
end
