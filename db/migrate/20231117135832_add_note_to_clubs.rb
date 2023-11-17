class AddNoteToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :comment, :text
  end
end
