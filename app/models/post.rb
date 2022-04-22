class Post < ApplicationRecord
    # タグのリレーションのみ記載
  has_many :post_hushtags, dependent: :destroy
  has_many :hushtags,through: :post_hushtags
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :post_text, presence: true
  validates :address, presence: true
  validates :genre_id, presence: true
  validates :hushtags, presence: true
   validates :address, presence: true


 enum price:{'１，０００〜５，０００円未満': 1, '５，０００〜１０，０００円未満': 2, '１０，０００〜２０，０００円未満': 3, '２０，０００円以上': 4}






geocoded_by :address
after_validation :geocode





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
