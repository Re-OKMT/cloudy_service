class Cloudy < ApplicationRecord

  
  validates :name, presence: true
  validates :image, presence: true
  belongs_to :user


end
