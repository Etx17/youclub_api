class CreateClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :claims do |t|
      t.string :full_name
      t.string :contact_email
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
