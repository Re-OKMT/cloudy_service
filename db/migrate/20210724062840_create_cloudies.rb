class CreateCloudies < ActiveRecord::Migration[6.0]
  def change
    create_table :cloudies do |t|
      t.string     :name
      t.string     :text
      t.text       :image
      #t.references :user,     foreign_key: true 
      t.timestamps
    end
  end
end
