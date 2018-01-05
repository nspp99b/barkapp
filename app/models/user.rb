class User < ApplicationRecord
  has_many :reviews
  has_many :parks, through: :reviews
  has_many :barks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_barks, through: :likes, :source => :bark

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


  def self.sorted_by_number_of_barks
    self.all.sort {|a, b| b.barks.count <=> a.barks.count}
  end

  def self.sorted_by_number_of_reviews
    self.all.sort {|a, b| b.reviews.count <=> a.reviews.count}
  end

  def self.sorted_by_creation
    self.all.sort {|a, b| b.created_at <=> a.created_at}
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

  def self.average_number_of_barks
    barks_by_user = Bark.group(:user).count
    @bark_value_array = barks_by_user.values
    answer = @bark_value_array.reduce(:+).to_f / @bark_value_array.size
    answer
  end

  def self.average_number_of_reviews
    reviews_by_user = Review.group(:user).count
    @review_value_array = reviews_by_user.values
    answer = @review_value_array.reduce(:+).to_f / @review_value_array.size
    answer
  end

  def self.average_number_of_likes
    likes_by_user = Like.group(:user).count
    @like_value_array = likes_by_user.values
    answer = @like_value_array.reduce(:+).to_f / @like_value_array.size
    answer
  end


   def self.median_number_of_barks
     @bark_value_array.median
   end

   def self.median_number_of_reviews
     @review_value_array.median
   end

   def self.median_number_of_likes
     @like_value_array.median
   end

end
