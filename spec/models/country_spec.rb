require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'associations' do
    it { should have_many(:cities).class_name('Place').with_foreign_key('parent_id').conditions(type: 'City') }
  end

  describe 'inheritance' do
    let(:country) { Country.create(name: "Bulgaria") }
    let(:city) { City.create(name: "Varna", parent_place: country) }

    it 'should be a type of Place' do
      expect(country).to be_a(Place)
    end

    it 'should return true for country?' do
      expect(country.country?).to be_truthy
    end

    it 'should have cities associated with it' do
      expect(country.cities).to include(city)
    end
  end
end
