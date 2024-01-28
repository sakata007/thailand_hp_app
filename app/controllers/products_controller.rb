class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def confirm
    puts "------"
    puts "confirm"
    puts "------"
    # @products = Product.all

    # Turbo Streams を使用せずに通常の HTML レスポンスを返す
    # respond_to do |format|
    #   format.html { render "order/confirm" }
    # end
    render "confirm"
  end

  def confirm2
    render "products/confirm2"
  end

  # def info
  #   render "confirm"
  # end

  private

  def product_params
    params.require(:product).permit(:name, :email, :date, :address)
  end
  
end
