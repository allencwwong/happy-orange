User.create!([
  {email: "allencwwong@gmail.com", encrypted_password: "$2a$10$6vWDH25DFbo74ozIAat8i.cL4CpuOU5JFszCQWfgJRWCFufaSOZfa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-05-08 07:54:48", last_sign_in_at: "2016-05-07 07:44:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
FoodPhoto.create!([
  {store_id: 1, photo_url: "https://s3.amazonaws.com/static.fitocracy.com/site_media/images/FRED-Hero.png", price: 99, food_name: "Hero", cuisine: "other", short_desc: "robo hero\t"},
  {store_id: 1, photo_url: "https://s3.amazonaws.com/static.fitocracy.com/site_media/images/FRED-AboutUs.png", price: 12, food_name: "robot", cuisine: "chinese\t\t", short_desc: "robo cop"},
  {store_id: 1, photo_url: "http://placekitten.com/270/270", price: 21, food_name: "kitty", cuisine: "chinese", short_desc: "skin that cat"},
  {store_id: 99, photo_url: nil, price: nil, food_name: nil, cuisine: nil, short_desc: nil}
])
FoodPhotoStatus.create!([
  {user_id: 1, food_photo_id: 2, status: "pass"},
  {user_id: 1, food_photo_id: 1, status: "like"},
  {user_id: 1, food_photo_id: 3, status: "like"},
  {user_id: 1, food_photo_id: 1, status: "pass"}
])
FoodTag.create!([
  {food_photo_id: 1, tag_name: "vegan"},
  {food_photo_id: 2, tag_name: "vegetarian"},
  {food_photo_id: 1, tag_name: "spicy"}
])
Store.create!([
  {name: "Allen Restuarant\t\t", phone: 1234567, address: "26 mariner lane\t", city: "daly city", state: "ca", zip: 94014, cuisine: "chinese"},
  {name: "index test\t", phone: nil, address: nil, city: nil, state: nil, zip: nil, cuisine: nil}
])
