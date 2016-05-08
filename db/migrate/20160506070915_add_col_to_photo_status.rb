class AddColToPhotoStatus < ActiveRecord::Migration
  def change
    add_column :food_photo_statuses,:user_id,:integer
    add_column :food_photo_statuses, :food_photo_id,:integer
    add_column :food_photo_statuses, :status,:string
  end
end
