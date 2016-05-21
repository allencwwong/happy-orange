require 'json'

class FoodsController < ApplicationController

  def index
    #hide all liked , passed , blocked food items
    puts current_user
    @display = true
    @selected_restaurant = Store.find(99)
    @selected_food_item_id = 99

  end

  def show
    @display = true
    if(params[:food_id])
      @selected_food_item_id = params[:food_id]
    else
      @selected_food_item_id = params[:id]      
    end
    # @selected_food_item_id = params[:id]
    @selected_restaurant = FoodPhoto.find(@selected_food_item_id).store
    selected_food_item = FoodPhoto.find(@selected_food_item_id)
    @selected_name = selected_food_item.food_name
    if selected_food_item.price <= 12
      @selected_price = "$"
    elsif selected_food_item.price > 12 && selected_food_item.price <= 20.99
      @selected_price = "$$"
    elsif selected_food_item.price >= 21 && selected_food_item.price <= 50
      @selected_price = "$$$"
    else
      @selected_price = "$$$$"
    end

    @food_tags = []
    selected_food_item.food_tags.each do |tag|
          food_tag = Hash.new
          food_tag[:id] = tag.id
          food_tag[:name] = tag.tag_name
          @food_tags.push(food_tag)
        end
    @selected_short_desc = selected_food_item.short_desc    


    @selected_restaurant_food_list = []

    @selected_restaurant.food_photos.each do |food|
      food_item = Hash.new
      food_item[:id] = food.id
      food_item[:url] = food.photo_url
   
         
      @selected_restaurant_food_list.push(food_item)
    end
  end

  def selected_option
    user_id = current_user.id
    store_id = params[:store_id]
    food_photo_id = params[:food_id]
    status = params[:selected]
    #create new row status
    food_statuses = FoodPhotoStatus.create(:user_id => user_id, :food_photo_id => food_photo_id, :status => status)

    flash[:notice] = "Created!"

    redirect_to "/"  
    
  end

  def liked_list
    @display = false
    user_id = current_user.id
    @liked_list = User.find(user_id).food_photo_statuses 
  end

  def destroy_liked_item
    status_id = params[:status_id]
    FoodPhotoStatus.find(status_id).destroy
    user_id = current_user.id
    @liked_list = User.find(user_id).food_photo_statuses    
    render :liked_list
  end

  def go
  end
  # private

  # def selected_option_params
  #   params.require(:FoodPhotoStatus).permit(:user_id, :food_photo_id, :status)
  # end  

end



##### creating json #####

   # def food_tags

   #  @food_tags = FoodTag.all
   #  @food_tag_list = []
   #  food_tag_ids = []

   #  @food_tags.each do |tag|
   #    food_tag_ids.push(tag.food_photo_id)
   #  end

   #  food_tag_ids.uniq!

   #    food_tag_ids.each do |id|
   #      food_tag = Hash.new
   #        # food_tag = id
   #        food_tag[:photo_id] = id
   #        index = 0
   #        @food_tags.each do |tag|
   #          if tag.food_photo_id == id
   #            food_tag[index] = tag.tag_name
   #            index+=1
   #          end
   #        end
   #      @food_tag_list.push(food_tag)
   #  end

   #  @food_tags_json = @food_tag_list.to_json
   #  puts(@food_tags_json)
   #  puts("==========")

   #  render :json => @food_tags_json
   # end

   # def food_details
   #  food_photos = FoodPhoto.all
   #  food_photo_list = []

   #  food_photos.each do |food|
   #    food_details = Hash.new
   #    food_details[:id] = food.id
   #    food_details[:store_id] = food.store_id
   #    food_details[:price] = food.price
   #    food_details[:cuisine] = food.cuisine
   #    food_details[:short_desc] = food.short_desc
   #    food_photo_list.push(food_details)
   #  end

   #  render :json => food_photo_list

   # end

