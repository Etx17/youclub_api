class AllowNullUserIdInClubs < ActiveRecord::Migration[7.0]
  def change
    change_column_null :clubs, :user_id, true
  end
end
