class Comment < ApplicationRecord
  belongs_to :cloudy  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end

