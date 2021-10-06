class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cloudies, dependent: :destroy
  has_many :comments  # commentsテーブルとのアソシエーション

  has_many :likes, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 6 }

  def already_liked?(cloudy)
    self.likes.exists?(cloudy: cloudy)
  end
  
end
