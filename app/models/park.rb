class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 255 }

  has_many :reviews
  has_many :users, through: :reviews
  
end
