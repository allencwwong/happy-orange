class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :food_name
      t.string :short_desc
      t.integer :zip
      t.integer :price
      t.string :cuisine

      t.timestamps null: false
    end
  end
end
