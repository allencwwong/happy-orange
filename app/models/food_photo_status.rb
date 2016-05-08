class FoodPhotoStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :food_photo
end
