class FoodPhoto < ActiveRecord::Base
  belongs_to :store
  has_many :food_tags
end
