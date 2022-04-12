class PostHushtag < ApplicationRecord
  belongs_to :post
  belongs_to :hushtag
  #validates :post_id, presence: true
  #validates :hushtag_id, presence: true
end
