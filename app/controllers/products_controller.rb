class ProductsController < ApplicationController

  def index
    @products = Product.all

    # choicesのjsonをハッシュに戻す処理
    @products.each do |product|
      hash = JSON.parse(product.choices)
      product.choices = hash
      end      
    end

  def create
    @product = Product.new
  end

  def store
    @product = Product.new(product_params)
    
    # ハッシュをjsonに変換
    input_hash = @product.choices
    json_array = input_hash.map.with_index do |(key, value), index|
      {index+1  => { "gram" => value["gram"], "price" => value["price"] }}
    end.to_json  
    
    @product.choices = json_array

    if @product.save
      redirect_to top_path
    else 
      render :create
    end
  end

  def confirm
    # TODO Order.new(order_params)の形にする
    @params = order_params
    puts "------"
    puts "↓オーダー"
    puts @params["order"]
    puts "↓名前"
    puts @params["name"]
    puts "------"

    render "confirm"
  end


  # def info
  #   render "confirm"
  # end

  private

  def product_params
    params.require(:product).permit(:name, :summary, :image, :sold_out_flg, choices: {} )
  end

  def order_params
    # TODO: orderモデル（Active Model）作成
    params.permit(:authenticity_token, :name, :address, :date, :email, :phone_number, :commit, order: {} )
  end

end
