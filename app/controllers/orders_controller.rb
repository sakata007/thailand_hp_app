class OrdersController < ApplicationController

    def index
        @order = Order.new
        @products = Product.all

        # choicesのjsonをハッシュに戻す処理
        @products.each do |product|
        hash = JSON.parse(product.choices)
        product.choices = hash
        end      
    end

    def confirm
        # MEMO: 理想はOrder.new(confirm_params)の形にする
        @order = Order.new(confirm_params)
        puts "------"
        puts "点検中"
        @order
        # puts params
        # puts confirm_params["name"]
        # puts @order.name
        puts "------"
        # puts confirm_params

        @name = confirm_params["name"]
        @address = confirm_params["address"]
        @date = confirm_params["date"]
        @email = confirm_params["email"]
        @phone_number = confirm_params["phone_number"]
        all_selects =  confirm_params["select"]

        # all_selects.each do |key, value|
        #     puts "---key---"            
        #     puts key
        #     puts "---value---"            
        #     puts value["price"]
        #     puts value["choice"]
        #     puts value["price"].blank?
        #     puts value["choice"].blank?
        #     if value["price"]=nil? || value["price"]=nil?
        #         all_selects.delete(key)
        #     end
        # end

        filtered_hash = all_selects.delete_if{|key, value|
            value["price"].blank? && value["choice"].blank?
        }

        @selected_products = filtered_hash

        puts "---濾過---"
        puts all_selects
        puts "-----"

        # filtered_hash = all_selects.reject { |_, params| params[:price].nil? || params[:choice].nil? }

        puts filtered_hash
        puts "------"
        puts @name
        puts @address
        puts @date
        puts @email
        puts @phone_number
        puts @selected_products
        puts "------"

        @total_price = 0;
        # 合計金額を算出する処理
        @selected_products.each do |key, value|
            price_text = value["price"]
            # TODO: 最初から数値で取得
            price = price_text.to_i
            @total_price = @total_price + price
        end

        render "confirm"
    end

    def complete
        puts 'completeです'
        puts params
    end

    private

    def confirm_params
        params.require(:order).permit(:name, :address, :date, :email, :phone_number, :commit, select: {})
    end

    def complete_params
        params.require(:order_complete).permit(:total_price, :customer_name, :customer_shipping_address, :customer_delivery_date_and_time, :customer_email, :customer_phone_number, order_products: {} )
    end

end
