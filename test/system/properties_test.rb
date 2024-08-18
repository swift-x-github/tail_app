require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "should create property" do
    visit properties_url
    click_on "New property"

    fill_in "Area", with: @property.area
    fill_in "Cost", with: @property.cost
    fill_in "Location", with: @property.location_id
    fill_in "Main photo 1", with: @property.main_photo_1
    fill_in "Main photo 2", with: @property.main_photo_2
    fill_in "Main photo 3", with: @property.main_photo_3
    fill_in "Property type", with: @property.property_type_id
    fill_in "Rooms", with: @property.rooms
    fill_in "Title", with: @property.title
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "should update Property" do
    visit property_url(@property)
    click_on "Edit this property", match: :first

    fill_in "Area", with: @property.area
    fill_in "Cost", with: @property.cost
    fill_in "Location", with: @property.location_id
    fill_in "Main photo 1", with: @property.main_photo_1
    fill_in "Main photo 2", with: @property.main_photo_2
    fill_in "Main photo 3", with: @property.main_photo_3
    fill_in "Property type", with: @property.property_type_id
    fill_in "Rooms", with: @property.rooms
    fill_in "Title", with: @property.title
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "should destroy Property" do
    visit property_url(@property)
    click_on "Destroy this property", match: :first

    assert_text "Property was successfully destroyed"
  end
end
