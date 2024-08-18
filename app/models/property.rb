class Property < ApplicationRecord
  belongs_to :location, class_name: 'Location', foreign_key: 'location_id'
  belongs_to :property_type

  has_many :property_facilities
  has_many :facilities, through: :property_facilities

  validates :title, presence: true
  validates :property_type, presence: true
  validates :rooms, presence: true, if: -> { property_type.property_category.name == "Residential" }
  validates :area, presence: true
  validates :cost, presence: true
  validates :location, presence: true

  validates :floor, presence: true
  validates :year_of_construction, presence: true

  def appartments?
    property_type.name.downcase == "appartments"
  end
end
