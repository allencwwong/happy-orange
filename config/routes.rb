Rails.application.routes.draw do
 devise_for :users
 get '/', to: 'foods#index'
 get '/liked-list', to: 'foods#liked_list'
 delete '/liked-list', to: 'foods#destroy_liked_item'
 get '/go', to: 'foods#go'
 # get '/food-tags-json', to: 'foods#food_tags'
 # get '/food-details-json', to: 'foods#food_details'
 resources :foods do 
    collection do
      post :selected_option
    end
  end
end
