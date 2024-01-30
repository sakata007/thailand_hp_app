# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create(name: 'product_A', summary: 'Aの商品概要です', sold_out_flg: 0, fast_shipping_flg: 0, choices: '{\"0\":{\"gram\":\"1\",\"price\":\"1000\"},\"1\":{\"gram\":\"2\",\"price\":\"2000\"},\"2\":{\"gram\":\"3\",\"price\":\"3000\"}}')
Product.create(name: 'product_B', summary: 'Bの商品概要です', sold_out_flg: 0, fast_shipping_flg: 0, choices: '{\"0\":{\"gram\":\"3\",\"price\":\"1500\"},\"1\":{\"gram\":\"6\",\"price\":\"3000\"},\"2\":{\"gram\":\"9\",\"price\":\"4500\"}}')
Product.create(name: 'product_C', summary: 'Cの商品概要です', sold_out_flg: 0, fast_shipping_flg: 0, choices: '{\"0\":{\"gram\":\"5\",\"price\":\"5000\"},\"1\":{\"gram\":\"10\",\"price\":\"10000\"},\"2\":{\"gram\":\"15\",\"price\":\"15000\"}}')
Product.create(name: 'product_D', summary: 'Dの商品概要です', sold_out_flg: 1, fast_shipping_flg: 0, choices: '{\"0\":{\"gram\":\"1\",\"price\":\"1000\"},\"1\":{\"gram\":\"2\",\"price\":\"2000\"},\"2\":{\"gram\":\"3\",\"price\":\"3000\"}}')
Product.create(name: 'product_E', summary: 'Eの商品概要です', sold_out_flg: 0, fast_shipping_flg: 1, choices: '{\"0\":{\"gram\":\"1\",\"price\":\"1000\"},\"1\":{\"gram\":\"2\",\"price\":\"2000\"},\"2\":{\"gram\":\"3\",\"price\":\"3000\"}}')
Product.create(name: 'product_F', summary: 'Fの商品概要です', sold_out_flg: 1, fast_shipping_flg: 1, choices: '{\"0\":{\"gram\":\"1\",\"price\":\"1000\"},\"1\":{\"gram\":\"2\",\"price\":\"2000\"},\"2\":{\"gram\":\"3\",\"price\":\"3000\"}}')


Shop.create(name: 'site_A', summary: 'A店舗です', email:'sampleA@sample', address:'東京都世田谷区111', phone_number:'000-000-000')


Setting.create(site_name: 'sitename_A', top_img: 'A店舗の画像です', privacy_policy:'A店舗のプライバシーポリシー')















