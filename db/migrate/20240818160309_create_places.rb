class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :parent_id
      t.string :type
      t.string :street_name
      t.string :house_number
      t.string :zip_code

      t.timestamps
    end
    
    add_index :places, :parent_id
    add_index :places, :type
    add_index :places, [:name, :parent_id], unique: true
  end
end
