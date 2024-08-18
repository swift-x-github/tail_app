class AddDetailsToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :floor, :integer
    add_column :properties, :house_floor_size, :integer
    add_column :properties, :furniture, :boolean, default: false
    add_column :properties, :sea_view, :boolean, default: false
    add_column :properties, :to_sea_distance, :integer
    add_column :properties, :to_center_distance, :integer
    add_column :properties, :to_airport_distance, :integer
    add_column :properties, :offer_type, :string
    add_column :properties, :year_of_construction, :integer
  end
end
