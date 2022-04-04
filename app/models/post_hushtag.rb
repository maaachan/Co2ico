class PostHushtag < ApplicationRecord
  belongs_to :hushtag
  belongs_to :post
end
