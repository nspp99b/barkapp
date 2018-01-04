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

  def self.sorted_by_overall_average
    self.all.sort {|a, b| b.overall_average <=> a.overall_average}
  end

  def self.sorted_by_energy_level_average
    self.all.sort {|a, b| b.energy_level_average <=> a.energy_level_average}
  end

  def self.sorted_by_facilities_average
    self.all.sort {|a, b| b.facilities_average <=> a.facilities_average}
  end

  def self.sorted_by_scene_average
    self.all.sort {|a, b| b.scene_average <=> a.scene_average}
  end

end
