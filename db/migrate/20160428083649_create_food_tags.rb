class CreateFoodTags < ActiveRecord::Migration
  def change
    create_table :food_tags do |t|
      t.integer :food_photo_id
      t.string :tag_name

      t.timestamps null: false
    end
  end
end
