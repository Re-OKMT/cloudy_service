class Cloudy < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  
  #以下現在地取得のため追加

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :image
  end

  
end