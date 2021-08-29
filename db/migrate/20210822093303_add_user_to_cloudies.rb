class AddUserToCloudies < ActiveRecord::Migration[6.0]
  def change
    add_reference :cloudies, :user, null: false, foreign_key: true
    add_column :cloudies, :adress, :string
  end
end
