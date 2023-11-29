class AddAddressAndZipcodeToSubGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_groups, :address, :string
    add_column :sub_groups, :zipcode, :string
  end
end
