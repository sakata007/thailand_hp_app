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
Shop.create(name: 'site_B', summary: 'B店舗です', email:'sampleB@sample', address:'東京都世田谷区121', phone_number:'000-000-111')
Shop.create(name: 'site_C', summary: 'C店舗です', email:'sampleC@sample', address:'東京都世田谷区123', phone_number:'000-000-222')
Shop.create(name: 'site_D', summary: 'D店舗です', email:'sampleD@sample', address:'東京都世田谷区134', phone_number:'000-000-333')
Shop.create(name: 'site_E', summary: 'E店舗です', email:'sampleE@sample', address:'東京都世田谷区145', phone_number:'000-000-444')
Shop.create(name: 'site_F', summary: 'F店舗です', email:'sampleF@sample', address:'東京都世田谷区166', phone_number:'000-000-555')


Setting.create(site_name: 'sitename_A', top_img: 'A店舗の画像です', privacy_policy:'A店舗のプライバシーポリシー')
Setting.create(site_name: 'sitename_B', top_img: 'B店舗の画像です', privacy_policy:'B店舗のプライバシーポリシー')
Setting.create(site_name: 'sitename_C', top_img: 'C店舗の画像です', privacy_policy:'C店舗のプライバシーポリシー')
Setting.create(site_name: 'sitename_D', top_img: 'D店舗の画像です', privacy_policy:'D店舗のプライバシーポリシー')
Setting.create(site_name: 'sitename_E', top_img: 'E店舗の画像です', privacy_policy:'E店舗のプライバシーポリシー')
Setting.create(site_name: 'sitename_F', top_img: 'F店舗の画像です', privacy_policy:'F店舗のプライバシーポリシー')














