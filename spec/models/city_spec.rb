# spec/models/city_spec.rb
require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'associations' do
    it { should belong_to(:country).class_name('Place').with_foreign_key('parent_id') }
    it { should have_many(:locations).class_name('Place').with_foreign_key('parent_id').conditions(type: 'Location') }
  end

  describe 'inheritance' do
    let(:country) { Country.create!(name: "Bulgaria") }
    let(:city) { City.create!(name: "Varna", parent_place: country) }
    let(:location) { Location.create!(name: "Sea Garden", parent_place: city, zip_code: "9000") } # Add zip_code

    it 'should be a type of Place' do
      expect(city).to be_a(Place)
    end

    it 'should return true for city?' do
      expect(city.city?).to be_truthy
    end

    it 'should belong to a country' do
      expect(city.country).to eq(country)
    end

    it 'should have locations associated with it' do
      location.save!  # Ensure the location is saved
      expect(city.locations).to include(location)
    end
  end
end
