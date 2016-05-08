class CreateFoodPhotoStatuses < ActiveRecord::Migration
  def change
    create_table :food_photo_statuses do |t|

      t.timestamps null: false
    end
  end
end
