class City < Place
  belongs_to :country, class_name: 'Place', foreign_key: 'parent_id'
  has_many :locations, -> { where(type: 'Location') }, class_name: 'Place', foreign_key: 'parent_id'
end
  