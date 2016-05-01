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
    main_photo_id = params[:photo].to_i
    main_photo_id_index = main_photo_id-1
    @main_photo_url = Store.find(params[:id]).food_photos.find(main_photo_id).photo_url
    @main_photo_name = Store.find(params[:id]).food_photos.find(main_photo_id).food_name
    restaurant_photo_collection = Store.find(params[:id]).food_photos
    @restaurant_photos = []
    restaurant_photo_collection.each do |rpc|
      @restaurant_photos << rpc
    end
    @restaurant_photos_ordered = @restaurant_photos.reverse!
    @restaurant_photos_ordered.insert(0,@restaurant_photos.delete_at(main_photo_id_index))
  end
end
