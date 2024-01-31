class OrdersController < ApplicationController

    def index
        @products = Product.all

        # choicesのjsonをハッシュに戻す処理
        @products.each do |product|
        hash = JSON.parse(product.choices)
        product.choices = hash
        end      
    end

    def confirm
        # TODO Order.new(order_params)の形にする
        @params = Order.new(order_params)
        puts "------"
        puts "↓オーダー"
        puts @params
        puts "------"

        render "confirm"
    end

    private

    def order_params
        params.require(:order).permit(:name, :address, :date, :email, :phone_number, :commit, order: {})
    end

end
