class Property < ApplicationRecord
  belongs_to :location
  belongs_to :property_type

  validates :title, presence: true
  validates :property_type, presence: true
  validates :rooms, presence: true, if: -> { property_type.property_category.name == "Residential" }
  validates :area, presence: true
  validates :cost, presence: true
  validates :location, presence: true
end
