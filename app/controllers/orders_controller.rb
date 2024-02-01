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
        @complete_order = CompleteOrder.new
        order = Order.new(confirm_params)

        # 入力された値を変数に代入
        @name = order.name
        @address = order.address
        @date = order.date
        @email = order.email
        @phone_number = order.phone_number
        # 現状、全ての商品情報がハッシュで送られてくる。
        # TODO: リクエスト前にnilのハッシュを排除
        all_selects =  order.select

        # ハッシュからnilを取り除く処理
        filtered_hash = all_selects.delete_if{|key, value|
            value["price"].blank? && value["choice"].blank?
        }

        @selected_products = filtered_hash

        # 合計金額を算出する処理
        @total_price = 0;
        @selected_products.each do |key, value|
            price_text = value["price"]
            # TODO: 最初から数値で取得
            price = price_text.to_i
            @total_price = @total_price + price
        end

        render "confirm"
    end

    def complete        
        complete_order = CompleteOrder.new(complete_params)

        # 入力された値を変数に代入
        @total_price = complete_order.total_price
        @customer_name = complete_order.customer_name
        @customer_shipping_address = complete_order.customer_shipping_address
        @customer_delivery_date_and_time = complete_order.customer_delivery_date_and_time
        @customer_email = complete_order.customer_email        
        @customer_phone_number = complete_order.customer_phone_number        
        @order_products = complete_order.order_products 

        OrderMailer.complete(email: @customer_email).deliver_later
        render "complete"
    end

    private

    def confirm_params
        params.require(:order).permit(:name, :address, :date, :email, :phone_number, select: {})
    end

    def complete_params
        params.require(:complete_order).permit(:total_price, :customer_name, :customer_shipping_address, :customer_delivery_date_and_time, :customer_email, :customer_phone_number, order_products: {})
    end

end
