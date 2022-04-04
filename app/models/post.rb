class Post < ApplicationRecord
  has_many :post_hushtags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  has_one_attached :image
  
  
end
