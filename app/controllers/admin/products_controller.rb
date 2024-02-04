class Admin::ProductsController < ApplicationController

    def index
        #管理者の商品一覧画面  
        @order = Order.new
        @products = Product.all

        # choicesのjsonをハッシュに戻す処理
        @products.each do |product|
            hash = JSON.parse(product.choices)
            product.choices = hash
        end  
    end

    def new
        puts "------"
        puts "newです"
        puts "------"
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        
        # ハッシュをjsonに変換
        input_hash = @product.choices
        json_array = input_hash.map.with_index do |(key, value), index|
        {index+1  => { "gram" => value["gram"], "price" => value["price"] }}
        end.to_json  
        
        @product.choices = json_array

        if @product.save
        flash[:notice] = "Product creation seccess!!."
        redirect_to top_path, notice: 'Product was successfully created.'
        else 
        flash[:alert] = 'Product creation failed.'
        logger.error("Validation failed: #{@product.errors.full_messages.join(', ')}")
        render :create
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :summary, :image, :sold_out_flg, :fast_shipping_flg,choices: {} )
    end

end
