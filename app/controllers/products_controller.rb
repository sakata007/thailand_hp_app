class ProductsController < ApplicationController

  def index
    product =Product.find(params[:id])
    @products =Product.followers
    @product = Product.find_by(id: params[:id])
  end

  



end
