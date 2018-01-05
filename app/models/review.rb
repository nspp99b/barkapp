class Review < ApplicationRecord
  belongs_to :park
  belongs_to :user

  validates :user_id, :park_id, :overall, :energy_level, :facilities, :scene, presence: true
  validates :overall, :energy_level, :facilities, :scene, :inclusion => { :in => 1..5 }
  validates :content, length: { maximum: 250 }
  default_scope -> { order(created_at: :desc) }

  def self.average_length
    reviews_with_content = self.where("length(content) > 0")
    reviews_to_use = reviews_with_content.length
    total_chars = 0
    reviews_with_content.each do |review|
      total_chars += review.content.length
    end
    total_chars/reviews_to_use
  end


end
