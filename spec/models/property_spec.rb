require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:country) { Country.create(name: "Bulgaria") }
  let(:city) { City.create(name: "Varna", parent_place: country) }
  let(:location) { Location.create(name: "Sea Garden", parent_place: city, zip_code: "9000") }
  let(:residential_category) { PropertyCategory.create(name: "Residential") }
  let(:property_type) { PropertyType.create(name: "Appartments", property_category: residential_category) }
  let(:property) do
    Property.create(
      title: "Luxury Appartment in Sea Garden",
      property_type: property_type,
      rooms: "3+1",
      area: 120,
      cost: 250000,
      location: location,
      floor: 5,
      house_floor_size: 10,
      furniture: true,
      sea_view: true,
      to_sea_distance: 50,
      to_center_distance: 200,
      to_airport_distance: 30,
      offer_type: "From the owner",
      year_of_construction: 2015,
      main_photo_1: "photo1.jpg",
      main_photo_2: "photo2.jpg",
      main_photo_3: "photo3.jpg"
    )
  end

  it "is valid with valid attributes" do
    expect(property).to be_valid
  end

  it "is not valid without a title" do
    property.title = nil
    expect(property).to_not be_valid
  end

  it "returns the correct country name" do
    expect(property.country_name).to eq("Bulgaria")
  end

  it "returns 'Country not found' if no country is associated" do
    location.update(parent_place: nil)
    expect(property.country_name).to eq("Country not found")
  end
end
