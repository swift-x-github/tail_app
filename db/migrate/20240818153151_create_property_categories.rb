class CreatePropertyCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :property_categories do |t|
      t.string :name

      t.timestamps
    end

    add_index :property_categories, :name, unique: true
  end
end
