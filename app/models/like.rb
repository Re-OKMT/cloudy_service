class Like < ApplicationRecord
  belongs_to :user
  belongs_to :cloudy
  

  validates_uniqueness_of :cloudy_id, scope: :user_id
end
