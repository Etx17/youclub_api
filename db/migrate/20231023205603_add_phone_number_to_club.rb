class AddPhoneNumberToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :phone_number, :string, null: true
  end
end
