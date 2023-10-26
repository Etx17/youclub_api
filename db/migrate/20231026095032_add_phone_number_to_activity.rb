class AddPhoneNumberToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :phone_number, :string, null: true
  end
end
