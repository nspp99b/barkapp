class Bark < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, :source => :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }


  def self.sorted_by_likes
    self.all.sort {|a, b| b.likes.count <=> a.likes.count}
  end

  def self.created_last_day
    self.all.where(:created_at => 1.day.ago..Time.now).count
  end

  def self.created_last_week
    self.all.where(:created_at => 1.week.ago..Time.now).count
  end

  def self.created_last_month
    self.all.where(:created_at => 1.month.ago..Time.now).count
  end

  def self.created_last_year
    self.all.where(:created_at => 1.year.ago..Time.now).count
  end

  def self.average_length
    barks_with_content = self.where("length(content) > 0")
    barks_to_use = barks_with_content.length
    total_chars = 0
    barks_with_content.each do |bark|
      total_chars += bark.content.length
    end
    total_chars/barks_to_use
  end

end
