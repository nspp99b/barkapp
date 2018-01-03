class Review < ApplicationRecord
  belongs_to :park
  belongs_to :user

  validates :user_id, :park_id, :overall, :energy_level, :facilities, :scene, presence: true
  validates :overall, :energy_level, :facilities, :scene, :inclusion => { :in => 1..5 }
  validates :content, length: { maximum: 250 }
  default_scope -> { order(created_at: :desc) }

end
