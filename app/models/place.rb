class Place < ApplicationRecord
  self.inheritance_column = :type

  # Связь с подчиненными местами
  has_many :sub_places, class_name: "Place", foreign_key: "parent_id", dependent: :destroy

  # Связь с родительским местом
  belongs_to :parent_place, class_name: "Place", foreign_key: "parent_id", optional: true

  validates :name, presence: true, uniqueness: { scope: :parent_id }

  # Методы для проверки типа места
  def country?
    type == 'Country'
  end

  def city?
    type == 'City'
  end

  def location?
    type == 'Location'
  end
end



