class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.new
  end

  def store
    #
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
    params.require(:product).permit(:name, :email, :date, :address)
  end
  
end
