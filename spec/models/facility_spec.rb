require 'rails_helper'

RSpec.describe Facility, type: :model do
  describe 'associations' do
    it { should have_many(:property_facilities) }
    it { should have_many(:properties).through(:property_facilities) }
  end

  describe 'validations' do
    subject { Facility.new(name: 'Gym') } # Задаем валидную запись

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end

