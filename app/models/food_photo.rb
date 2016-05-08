class FoodPhoto < ActiveRecord::Base
  belongs_to :store
  has_many :food_tags

  has_many :food_photo_statuses
  has_many :users, through: :food_photo_statuses  
end
