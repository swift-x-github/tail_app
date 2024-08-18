class PropertyCategory < ApplicationRecord
  has_many :property_types, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
  

  
