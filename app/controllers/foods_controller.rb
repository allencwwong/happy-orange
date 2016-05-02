class FoodsController < ApplicationController
  def index
    #randomize food pic 
    #create food pic list
    #if pic liked store into liked list
    #if pic rejected store into rejected list
    #if pic banned sotre into banned list
    #if pic selected go to show page base on store id as params and display selected pic as main image


  end

  def show

    #create food tags 

    @food_tags = FoodTag.all
    @food_tag_list = []
    food_tag_ids = []

    @food_tags.each do |tag|
      food_tag_ids.push(tag.food_photo_id)
    end

    food_tag_ids.uniq!

      food_tag_ids.each do |id|
        food_tag = Hash.new
          food_tag[:id] = id
          index = 0
          @food_tags.each do |tag|
            if tag.food_photo_id == id
              food_tag[index] = tag.tag_name
              index+=1
            end
          end
        @food_tag_list.push(food_tag)
    end

    @current_restaurant = Store.find(params[:id])
    main_photo_id = params[:photo].to_i
    main_photo_id_index = main_photo_id-1
    @main_photo_url = @current_restaurant.food_photos.find(main_photo_id).photo_url
    @main_photo_name = @current_restaurant.food_photos.find(main_photo_id).food_name
    restaurant_photo_collection = @current_restaurant.food_photos
    @restaurant_photos = []
    restaurant_photo_collection.each do |rpc|
      @restaurant_photos << rpc
    end
    @restaurant_photos_ordered = @restaurant_photos.reverse!
    @restaurant_photos_ordered.insert(0,@restaurant_photos.delete_at(main_photo_id_index))

  end
end
