class AddRetrievedToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :retrieved, :boolean, default: false
  end
end
