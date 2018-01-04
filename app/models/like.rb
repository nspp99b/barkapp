class Like < ApplicationRecord
  belongs_to :user
  belongs_to :bark
  validates :user_id, presence: true, uniqueness: { scope: :bark_id }
  validates :bark_id, presence: true
end
