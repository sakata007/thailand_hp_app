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
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        
        # 入力された値（ハッシュ形式）を変数に代入
        input_hash = @product.choices

        # 空の入力値を除く処理
        i = 1;
        hash_array = {};
        input_hash.each do |key, value|
            if !value["gram"].blank? && !value["price"].blank?
                hash_array[i] = { "gram" => value["gram"], "price" => value["price"] }
                i = i + 1
            end
        end 
        
        # 空の文字列を除いたハッシュをjson形式に変換
        json_array = hash_array.map.with_index do |(key, value), j|
        {j+1  => { "gram" => value["gram"], "price" => value["price"] }}
        end.to_json 
        
        @product.choices = json_array

        if @product.save
        flash[:notice] = "Product creation seccess!!."
        redirect_to admin_products_path, notice: 'Product was successfully created.'
        else 
        flash[:alert] = 'Product creation failed.'
        logger.error("Validation failed: #{@product.errors.full_messages.join(', ')}")
        render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
        @product.choices = JSON.parse(@product.choices)
    end

    def update
        @product = Product.find(params[:id])
        
        # ハッシュをjsonに変換
        input_hash = product_params["choices"]
        
        json_array = input_hash.to_h.map.with_index do |(key, value), index|
            {key.to_i  => { "gram" => value["gram"], "price" => value["price"] }}
        end.to_json  

        if @product.update(product_params) && @product.update(choices: json_array)
                flash[:notice] = "Product creation seccess!!."
                redirect_to admin_products_path, notice: 'Product was successfully update.'
        else 
            flash[:alert] = 'Product creation failed.'
            logger.error("Validation failed: #{@product.errors.full_messages.join(', ')}")
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        flash[:notice] = "Deletion completed"
        redirect_to admin_products_path
    end

    private

    def product_params
        params.require(:product).permit(:name, :summary, :image, :sold_out_flg, :fast_shipping_flg,choices: {} )
    end

end
