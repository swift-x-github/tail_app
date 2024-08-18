class Facility < ApplicationRecord
  has_many :property_facilities
  has_many :properties, through: :property_facilities

  validates :name, presence: true, uniqueness: true
end
