# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create(name: 'product_A', summary: 'This is a productA', base_price: '1500baht/g', sold_out_flg: 0, fast_shipping_flg: 0, choices: '{\"1\":{\"gram\":\"1\",\"price\":\"1000\"},\"2\":{\"gram\":\"2\",\"price\":\"2000\"},\"3\":{\"gram\":\"3\",\"price\":\"3000\"}}')
Product.create(name: 'product_B', summary: 'This is a productB', sold_out_flg: 0, fast_shipping_flg: 0, choices: '{\"1\":{\"gram\":\"3\",\"price\":\"1500\"},\"2\":{\"gram\":\"6\",\"price\":\"3000\"},\"3\":{\"gram\":\"9\",\"price\":\"4500\"}}')
Product.create(name: 'product_C', summary: 'This is a productC', base_price: '3000baht/g', sold_out_flg: 0, fast_shipping_flg: 0, choices: '{\"1\":{\"gram\":\"5\",\"price\":\"5000\"},\"2\":{\"gram\":\"10\",\"price\":\"10000\"},\"3\":{\"gram\":\"15\",\"price\":\"15000\"}}')
Product.create(name: 'product_D', summary: 'This is a productD', sold_out_flg: 1, fast_shipping_flg: 0, choices: '{\"1\":{\"gram\":\"1\",\"price\":\"1000\"},\"2\":{\"gram\":\"2\",\"price\":\"2000\"},\"3\":{\"gram\":\"3\",\"price\":\"3000\"}}')
Product.create(name: 'product_E', summary: 'This is a productE', base_price: '5000baht/g', sold_out_flg: 0, fast_shipping_flg: 1, choices: '{\"1\":{\"gram\":\"1\",\"price\":\"1000\"},\"2\":{\"gram\":\"2\",\"price\":\"2000\"},\"3\":{\"gram\":\"3\",\"price\":\"3000\"}}')
Product.create(name: 'product_F', summary: 'This is a productF', sold_out_flg: 1, fast_shipping_flg: 1, choices: '{\"1\":{\"gram\":\"1\",\"price\":\"1000\"},\"2\":{\"gram\":\"2\",\"price\":\"2000\"},\"3\":{\"gram\":\"3\",\"price\":\"3000\"}}')


Shop.create(name: 'site_A', summary: 'This is store A.', email:'sampleA@sample', address:'111, Setagaya-ku, Tokyo', phone_number:'000-000-000')


Setting.create(site_name: 'sitename_A', top_img: 'This is an image of store A.', privacy_policy:'Store A privacy policy')















