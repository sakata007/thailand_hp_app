class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.new
  end

  def store
    @product = Product.new(product_params)
    puts "------"
    puts "store"
    puts @product
    puts @product.name
    puts @product.summary
    puts @product.image
    puts @product.sold_out_flg
    puts @product.choices
    puts "------"
    
    # MEMO: { num => {"gram" => gram, "price" => price}, ...}の形でjsonに入れてもいいかもしれない
    input_hash = @product.choices
    json_array = input_hash.map do |key, value|
      { "gram" => value["gram"], "price" => value["price"] }
    end.to_json
    
    # puts "------"
    # puts "json_array"
    # puts json_array
    # puts json_array[1]
    # puts "------"

    # if @product.save
    #   redirect_to top_path
    # else 
    #   render :create
    # end
  end

  def confirm
    puts "------"
    puts "confirm"
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
  
end
