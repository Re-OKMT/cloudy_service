class AddUserToCloudies < ActiveRecord::Migration[6.0]
  def change
    add_reference :cloudies, :user, null: false
    
    add_column :cloudies, :address, :string
    
  end
end
