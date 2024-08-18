class Country < Place
  has_many :cities, -> { where(type: 'City') }, class_name: 'Place', foreign_key: 'parent_id'
end
  