class CreateFoodPhotos < ActiveRecord::Migration
  def change
    create_table :food_photos do |t|
      t.integer :store_id
      t.string :photo_url
      t.integer :price
      t.string :food_name
      t.string :cuisine
      t.string :short_desc

      t.timestamps null: false
    end
  end
end
