class CreateImages < ActiveRecord::Migration[5.0]
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
  end
end