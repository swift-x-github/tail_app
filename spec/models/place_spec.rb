# spec/models/place_spec.rb
require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'associations' do
    it { should have_many(:sub_places).class_name('Place').with_foreign_key('parent_id').dependent(:destroy) }
    it { should belong_to(:parent_place).class_name('Place').with_foreign_key('parent_id').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:parent_id) }
  end

  describe 'methods' do
    let(:country) { Country.create(name: "Bulgaria") }
    let(:city) { City.create(name: "Varna", parent_place: country) }
    let(:location) { Location.create(name: "Sea Garden", parent_place: city, zip_code: "9000") }

    it 'should return true for country?' do
      expect(country.country?).to be_truthy
    end

    it 'should return true for city?' do
      expect(city.city?).to be_truthy
    end

    it 'should return true for location?' do
      expect(location.location?).to be_truthy
    end
  end
end
