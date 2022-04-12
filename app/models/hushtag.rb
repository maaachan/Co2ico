class Hushtag < ApplicationRecord
  has_many :post_hushtags,dependent: :destroy, foreign_key: 'hushtag_id'
  # タグは複数の投稿を持つ　それは、post_tagsを通じて参照できる
  has_many :posts,through: :post_hushtags

  validates :name, uniqueness: true, presence: true
end
