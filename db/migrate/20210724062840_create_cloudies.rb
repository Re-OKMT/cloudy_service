class CreateCloudies < ActiveRecord::Migration[6.0]
  def change
    create_table :cloudies do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :text
      t.text   :image       ,null: false
      t.timestamps
    end
  end
end
