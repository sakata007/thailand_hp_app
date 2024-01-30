class ProductsController < ApplicationController

  def index
    @products = Product.all
    @products.each do |product|
      puts "------"
      hash = JSON.parse(product.choices)
      product.choices = hash
      puts hash
      # puts product.choices
      hash.each do |key|
        puts "---↓keyです---"
        puts key
          key.each do |id, value|
            puts "---↓idです---"
            puts id
            puts "---↓valueです---"
            puts value
          end
        # puts key
        # key.each do |id, keyword|
        #   puts "---↓idです---"
        #   puts id
        #   puts "---↓keywordです---"
        #   puts keyword["gram"]
        #   puts keyword["price"]
        # end
        # puts "---↓valueです---"
        # puts value
      end

      puts "------"
      
    end
    # @product_choices = @products.map { |product| JSON.parse(product.choices) }
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
    json_array = input_hash.map.with_index do |(key, value), index|
      {index+1  => { "gram" => value["gram"], "price" => value["price"] }}
    end.to_json  
    
    puts "------"
    puts "json_array"
    puts json_array
    puts json_array[1]
    puts "------"

    @product.choices = json_array

    puts @product.choices

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
    params.require(:product).permit(:name, :summary, :image, :sold_out_flg, choices: {} )
  end
  
end
