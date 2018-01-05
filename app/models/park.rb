class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 255 }

  has_many :reviews
  has_many :users, through: :reviews

  def self.all_with_reviews
    self.all.select do |p|
      if p.reviews.size > 0
        p
      end
    end
  end

  def self.sorted_by_overall_average
    self.all_with_reviews.sort {|a, b| b.overall_average <=> a.overall_average}
  end

  def self.sorted_by_energy_level_average
    self.all_with_reviews.sort {|a, b| b.energy_level_average <=> a.energy_level_average}
  end

  def self.sorted_by_facilities_average
    self.all_with_reviews.sort {|a, b| b.facilities_average <=> a.facilities_average}
  end

  def self.sorted_by_scene_average
    self.all_with_reviews.sort {|a, b| b.scene_average <=> a.scene_average}
  end

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

  def most_freq_overall_rating
    arr = self.reviews.map do |r|
      r.overall
    end
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr.max_by { |v| freq[v] }
  end

  def most_freq_energy_level_rating
    arr = self.reviews.map do |r|
      r.energy_level
    end
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr.max_by { |v| freq[v] }
  end

  def most_freq_facilities_rating
    arr = self.reviews.map do |r|
      r.facilities
    end
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr.max_by { |v| freq[v] }
  end

  def most_freq_scene_rating
    arr = self.reviews.map do |r|
      r.scene
    end
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr.max_by { |v| freq[v] }
  end

end
