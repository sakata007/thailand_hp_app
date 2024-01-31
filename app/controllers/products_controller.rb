class ProductsController < ApplicationController

  def index
    #管理者の商品一覧画面  
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

  private

  def product_params
    params.require(:product).permit(:name, :summary, :image, :sold_out_flg, choices: {} )
  end

end
