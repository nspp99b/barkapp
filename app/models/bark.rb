class Bark < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, :source => :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  def find_like_id_by_user(user)
    self.likes.find_by(user_id: user).id
  end

end
