class CreateTarifications < ActiveRecord::Migration[7.0]
  def change
    create_table :tarifications do |t|
      t.integer :amount
      t.string :recurrence
      t.string :label
      t.string :description
      t.references :sub_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
