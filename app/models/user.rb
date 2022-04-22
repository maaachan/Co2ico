class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :image

  scope :only_active, -> { where(is_active: true) }


  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower



  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
# フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
# フォローしているか判定
  def following?(user)
    followings.include?(user)
  end



  def get_image
    unless image.attached?
      #file_path = Rails.root.join('app/assets/images/default.jp')
      #image.attach(io: File.open(file_path), filename: 'default.png',)

    end
    image
  end

  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
