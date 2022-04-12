class Post < ApplicationRecord
    # タグのリレーションのみ記載
  has_many :post_hushtags, dependent: :destroy
  has_many :hushtags,through: :post_hushtags
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  
  
end
