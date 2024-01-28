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

    if @product.save
      redirect_to top_path
    else 
      render :create
    end
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
    params.require(:product).permit(:name, :summary, :image, :choices, :sold_out_flg)
  end
  
end
