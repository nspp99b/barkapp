class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 255 }

  has_many :reviews
  has_many :users, through: :reviews


  def overall_average
    self.reviews.average(:overall)
  end

  def energy_level_average
    self.reviews.average(:energy_level)
  end

  def facilities_average
    self.reviews.average(:facilities)
  end

  def scene_average
    self.reviews.average(:scene)
  end

  def self.sorted_by_average
    parks = self.all
    parks.sort {|a, b| b.reviews.average(:overall) <=> a.reviews.average(:overall)}
  end


end
