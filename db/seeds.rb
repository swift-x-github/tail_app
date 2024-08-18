# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Категория "Residential"
residential = PropertyCategory.create(name: "Residential")
PropertyType.create(name: "Appartments", property_category: residential)
PropertyType.create(name: "Penthouse", property_category: residential)
PropertyType.create(name: "Duplex", property_category: residential)
PropertyType.create(name: "Villas", property_category: residential)
PropertyType.create(name: "Home", property_category: residential)

# Категория "Commercial"
commercial = PropertyCategory.create(name: "Commercial")
PropertyType.create(name: "Office", property_category: commercial)
PropertyType.create(name: "Shop", property_category: commercial)
PropertyType.create(name: "Caffe", property_category: commercial)
PropertyType.create(name: "Storage", property_category: commercial)
PropertyType.create(name: "Hotel", property_category: commercial)
PropertyType.create(name: "Factory", property_category: commercial)
PropertyType.create(name: "Garage", property_category: commercial)
PropertyType.create(name: "Parkingplace", property_category: commercial)

# Категория "Земля"
land = PropertyCategory.create(name: "Land")
PropertyType.create(name: "Commerce", property_category: land)
PropertyType.create(name: "Agro", property_category: land)
PropertyType.create(name: "Rest", property_category: land)
