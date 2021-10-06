class AddLatitudeAndLongitudeToCloudies < ActiveRecord::Migration[6.0]
  def change
    add_column :cloudies, :latitude, :float
    add_column :cloudies, :longitude, :float
  end
end
