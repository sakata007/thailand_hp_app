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
        # MEMO: 理想はOrder.new(order_params)の形にする

        @name = order_params["name"]
        @address = order_params["address"]
        @date = order_params["date"]
        @email = order_params["email"]
        @phone_number = order_params["phone_number"]
        @selected_products =  order_params["select"]

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

    private

    def order_params
        params.require(:order).permit(:name, :address, :date, :email, :phone_number, :commit, select: {})
    end

end
