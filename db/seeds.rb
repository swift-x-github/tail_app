# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# # Категория "Residential"
# residential = PropertyCategory.create(name: "Residential")
# PropertyType.create(name: "Appartments", property_category: residential)
# PropertyType.create(name: "Penthouse", property_category: residential)
# PropertyType.create(name: "Duplex", property_category: residential)
# PropertyType.create(name: "Villas", property_category: residential)
# PropertyType.create(name: "Home", property_category: residential)

# # Категория "Commercial"
# commercial = PropertyCategory.create(name: "Commercial")
# PropertyType.create(name: "Office", property_category: commercial)
# PropertyType.create(name: "Shop", property_category: commercial)
# PropertyType.create(name: "Caffe", property_category: commercial)
# PropertyType.create(name: "Storage", property_category: commercial)
# PropertyType.create(name: "Hotel", property_category: commercial)
# PropertyType.create(name: "Factory", property_category: commercial)
# PropertyType.create(name: "Garage", property_category: commercial)
# PropertyType.create(name: "Parkingplace", property_category: commercial)

# # Категория "Земля"
# land = PropertyCategory.create(name: "Land")
# PropertyType.create(name: "Commerce", property_category: land)
# PropertyType.create(name: "Agro", property_category: land)
# PropertyType.create(name: "Rest", property_category: land)

# Ensure classes are loaded
require_dependency 'place'

# Создание страны
bulgaria = Country.create!(name: "Bulgaria")

# Создание города
varna = City.create!(name: "Varna", parent_place: bulgaria)

# Создание локаций
sea_garden = Location.create!(name: "Sea Garden", parent_place: varna, street_name: "Sea Garden Street", house_number: "1", zip_code: "9000")
city_center = Location.create!(name: "City Center", parent_place: varna, street_name: "Central Blvd", house_number: "15", zip_code: "9000")
asparuhovo = Location.create!(name: "Asparuhovo", parent_place: varna, street_name: "Asparuhovo Street", house_number: "30", zip_code: "9000")

# Создание категорий недвижимости
residential_category = PropertyCategory.create!(name: "Residential")
commercial_category = PropertyCategory.create!(name: "Commercial")
land_category = PropertyCategory.create!(name: "Land")

# Проверяем, что категории были созданы
puts "Residential Category ID: #{residential_category.id}"
puts "Commercial Category ID: #{commercial_category.id}"
puts "Land Category ID: #{land_category.id}"

# Создание типов недвижимости с явным указанием категории
appartments_type = PropertyType.create!(name: "Appartments", property_category: residential_category)
penthouse_type = PropertyType.create!(name: "Penthouse", property_category: residential_category)
office_type = PropertyType.create!(name: "Office", property_category: commercial_category)

# Создание инфраструктуры
facilities = [
  "Wireless Internet", "Power generator", "Playground", "Video surveillance 24/7", 
  "Indoor pool", "Satellite TV", "Fitness Centre", "Outdoor parking",
  "Game room", "Gazebos for rest", "Children swimming pool", "Open pool"
]

facilities.each do |facility_name|
  Facility.find_or_create_by!(name: facility_name)
end

# Создание объектов недвижимости в локации Sea Garden
2.times do |i|
  property = Property.create!(
    title: "Luxury Appartment in Sea Garden ##{i+1}",
    property_type: appartments_type, # Передаем объект PropertyType
    rooms: "3+1",
    area: 120,
    floor: 5,
    house_floor_size: 10,
    furniture: true,
    sea_view: true,
    to_sea_distance: 50,
    to_center_distance: 200,
    to_airport_distance: 30,
    offer_type: "From the owner",
    year_of_construction: 2015,
    cost: 250000 + i * 10000,
    location: sea_garden, # Передаем объект Location
    main_photo_1: "photo1.jpg",
    main_photo_2: "photo2.jpg",
    main_photo_3: "photo3.jpg"
  )
  property.facilities << Facility.where(name: facilities)
end