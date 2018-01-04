class Like < ApplicationRecord
  belongs_to :user
  belongs_to :bark
  validates :user_id, presence: true
  validates :bark_id, presence: true
end
