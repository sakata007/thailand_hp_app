class AddBasePriceToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :base_price, :string, limit: 255
  end
end
