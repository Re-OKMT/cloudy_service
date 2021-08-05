class Cloudy < ApplicationRecord

  
  validates :image, presence: true
  belongs_to :user

end
