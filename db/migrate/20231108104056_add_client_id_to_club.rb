class AddClientIdToClub < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :google_review_client_id, :string
  end
end
