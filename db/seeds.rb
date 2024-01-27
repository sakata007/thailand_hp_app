# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create(name: 'product_A', summary: 'Aの商品概要です', sold_out_flg: 0)
Product.create(name: 'product_B', summary: 'Bの商品概要です', sold_out_flg: 0)
Product.create(name: 'product_C', summary: 'Cの商品概要です', sold_out_flg: 0)
Product.create(name: 'product_D', summary: 'Dの商品概要です', sold_out_flg: 0)
Product.create(name: 'product_E', summary: 'Eの商品概要です', sold_out_flg: 0)
Product.create(name: 'product_F', summary: 'Fの商品概要です', sold_out_flg: 0)
