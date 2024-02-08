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
        @order= Order.new(confirm_params)
        @complete_order = CompleteOrder.new

        # 入力された値を変数に代入
        @name = @order.name
        @address = @order.address
        @delivery_date = @order.delivery_date
        @delivery_time = @order.delivery_time
        @email = @order.email
        @phone_number = @order.phone_number

        # バリデーションが成功した場合の処理
        if @order.valid?

            # 現状、全ての商品情報がハッシュで送られてくる。
            all_selects =  @order.select

            # ハッシュからnilを取り除く処理
            filtered_hash = all_selects.delete_if{|key, value|
                # value["price"].blank? && value["choice"].blank?
                value["choice"].blank?
            }

            @selected_products = filtered_hash

            # 合計金額を算出する処理
            @total_price = 0;
            @selected_products.each do |key, value|
                input_choice_string = value["choice"]
                # 正規表現を使用して数字を取り出す
                match_data = /\/\s*([\d,]+)\s*baht/.match(input_choice_string)
            
                result = match_data[1].gsub(',', '')

                price = result.to_i
                @total_price = @total_price + price
            end

            render "confirm"
        else
            # バリデーションエラーがある場合の処理
            @products = Product.all
            @products.each do |product|
                hash = JSON.parse(product.choices)
                product.choices = hash
            end

            # productの選択履歴を保持
            @history = confirm_params["select"]

            render "index"
        end
    end

    def back
        complete_order = CompleteOrder.new(complete_params)
        
        # 入力された値を変数に代入
        @email = complete_order.customer_email        
        @name = complete_order.customer_name
        @address = complete_order.customer_shipping_address
        @delivery_date = complete_order.customer_delivery_date
        @delivery_time = complete_order.customer_delivery_time
        @phone_number = complete_order.customer_phone_number    
        
        @order = Order.new
        @products = Product.all
        @products.each do |product|
            hash = JSON.parse(product.choices)
            product.choices = hash
        end
        
        @history = complete_order.order_products
        
        render "index"
    end

    def complete        
        complete_order = CompleteOrder.new(complete_params)

        # 注文IDを生成
        @random_text = "";
        for i in 1..2
            text = ('A'..'Z').to_a[rand(26)]
            @random_text = @random_text + text
        end
        
        @random_num = "";
        5.times do
            num = "#{rand(10)}" #1〜9までの数値
            @random_num = @random_num + num
        end

        @order_id = @random_text + "-" + @random_num
        
        # 入力された値を変数に代入
        @customer_email = complete_order.customer_email        
        @total_price = complete_order.total_price
        @customer_name = complete_order.customer_name
        @customer_shipping_address = complete_order.customer_shipping_address
        @customer_delivery_date = complete_order.customer_delivery_date
        @customer_delivery_time = complete_order.customer_delivery_time
        @customer_phone_number = complete_order.customer_phone_number        
        @order_products = complete_order.order_products 
        
        OrderMailer.complete(
            email: @customer_email,
            total_price: @total_price,
            customer_name: @customer_name,
            customer_shipping_address: @customer_shipping_address,
            customer_delivery_date: @customer_delivery_date,
            customer_delivery_time: @customer_delivery_time,
            customer_phone_number: @customer_phone_number,
            order_products: @order_products,
            order_id: @order_id
        ).deliver_later

        render "complete"
    end

    private

    def confirm_params
        params.require(:order).permit(:name, :address, :delivery_date, :delivery_time, :email, :phone_number, select: {})
    end

    def complete_params
        params.require(:complete_order).permit(:total_price, :customer_name, :customer_shipping_address, :customer_delivery_date, :customer_delivery_time , :customer_email, :customer_phone_number, order_products: {})
    end

end
