class AddDefaultStatusToClaims < ActiveRecord::Migration[7.0]
  def change
    change_column_default :claims, :status, from: nil, to: 0
  end
end
