class Location < Place
  belongs_to :city, class_name: 'Place', foreign_key: 'parent_id'

  validates :street_name, presence: true
  validates :house_number, presence: true
  validates :zip_code, presence: true
end
