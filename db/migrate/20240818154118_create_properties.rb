class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.references :property_type, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: { to_table: :places }
      t.string :rooms
      t.integer :area
      t.decimal :cost
      t.string :main_photo_1
      t.string :main_photo_2
      t.string :main_photo_3

      t.timestamps
    end
  end
end
