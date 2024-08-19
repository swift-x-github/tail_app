require 'rails_helper'

RSpec.describe PropertyFacility, type: :model do
  describe 'associations' do
    it { should belong_to(:property) }
    it { should belong_to(:facility) }
  end

  describe 'validations' do
    it 'validates presence of property_id' do
      property_facility = PropertyFacility.new(facility_id: 1)  # Only set facility_id
      expect(property_facility.valid?).to be_falsey
      expect(property_facility.errors[:property]).to include('must exist')
    end

    it 'validates presence of facility_id' do
      property_facility = PropertyFacility.new(property_id: 1)  # Only set property_id
      expect(property_facility.valid?).to be_falsey
      expect(property_facility.errors[:facility]).to include('must exist')
    end
  end
end