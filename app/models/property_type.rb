class PropertyType < ApplicationRecord
  belongs_to :property_category
  has_many :properties

  validates :name, presence: true
  validates :property_category, presence: true
end
