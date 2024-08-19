class Location < Place
  belongs_to :city, class_name: 'Place', foreign_key: 'parent_id'

  validates :zip_code, presence: true
end
