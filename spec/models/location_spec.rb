require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'associations' do
    it { should belong_to(:city).class_name('Place').with_foreign_key('parent_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:zip_code) }
  end

  describe 'inheritance' do
    let(:country) { Country.create(name: "Bulgaria") }
    let(:city) { City.create(name: "Varna", parent_place: country) }
    let(:location) { Location.create(name: "Sea Garden", parent_place: city, zip_code: "9000") }

    it 'should be a type of Place' do
      expect(location).to be_a(Place)
    end

    it 'should return true for location?' do
      expect(location.location?).to be_truthy
    end
  end
end
