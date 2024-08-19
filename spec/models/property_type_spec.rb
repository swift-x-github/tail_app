require 'rails_helper'

RSpec.describe PropertyType, type: :model do
  describe 'associations' do
    it { should belong_to(:property_category) }
    it { should have_many(:properties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:property_category) }
  end

  describe '.create' do
    let(:property_category) { PropertyCategory.create(name: "Residential") }

    it 'creates a valid PropertyType' do
      property_type = PropertyType.new(name: "Appartments", property_category: property_category)

      expect(property_type).to be_valid
      expect(property_type.save).to be true
    end

    it 'is invalid without a name' do
      property_type = PropertyType.new(property_category: property_category)

      expect(property_type).not_to be_valid
      expect(property_type.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a property_category' do
      property_type = PropertyType.new(name: "Appartments")

      expect(property_type).not_to be_valid
      expect(property_type.errors[:property_category]).to include("can't be blank")
    end
  end
end
