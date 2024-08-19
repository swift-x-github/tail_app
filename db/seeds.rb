# Создание пользователя с email и паролем
User.find_or_create_by!(email: 'swift.x@yahoo.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.admin = true
end

# Категория "Residential"
residential = PropertyCategory.find_or_create_by!(name: "Residential")
["Appartments", "Penthouse", "Duplex", "Villas", "Home"].each do |type_name|
  PropertyType.find_or_create_by!(name: type_name, property_category: residential)
end

# Категория "Commercial"
commercial = PropertyCategory.find_or_create_by!(name: "Commercial")
["Office", "Shop", "Caffe", "Storage", "Hotel", "Factory", "Garage", "Parkingplace"].each do |type_name|
  PropertyType.find_or_create_by!(name: type_name, property_category: commercial)
end

# Категория "Land"
land = PropertyCategory.find_or_create_by!(name: "Land")
["Commerce", "Agro", "Rest"].each do |type_name|
  PropertyType.find_or_create_by!(name: type_name, property_category: land)
end

# Создание страны
bulgaria = Country.find_or_create_by!(name: "Bulgaria")

# Создание города
varna = City.find_or_create_by!(name: "Varna", parent_place: bulgaria)

# Создание локаций
sea_garden = Location.find_or_create_by!(name: "Sea Garden", parent_place: varna, zip_code: "9000")

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
  property = Property.find_or_create_by!(
    title: "Luxury Appartment in Sea Garden ##{i+1}",
    property_type: PropertyType.find_by(name: "Appartments", property_category: residential), # Используем find_by, чтобы избежать дублирования
    location: sea_garden, # Передаем объект Location
  ) do |prop|
    prop.rooms = "3+1"
    prop.area = 120
    prop.floor = 5
    prop.house_floor_size = 10
    prop.furniture = true
    prop.sea_view = true
    prop.to_sea_distance = 50
    prop.to_center_distance = 200
    prop.to_airport_distance = 30
    prop.offer_type = "From the owner"
    prop.year_of_construction = 2015
    prop.cost = 250000 + i * 10000
    prop.main_photo_1 = "photo1.jpg"
    prop.main_photo_2 = "photo2.jpg"
    prop.main_photo_3 = "photo3.jpg"
  end
  property.facilities << Facility.where(name: facilities) if property.persisted?
end
