class CreatePropertyTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :property_types do |t|
      t.string :name, null: false
      t.references :property_category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :property_types, [:name, :property_category_id], unique: true
  end
end
