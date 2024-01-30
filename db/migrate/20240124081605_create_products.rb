class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :summary
      t.text :detail
      t.boolean :sold_out_flg
      t.boolean :fast_shipping_flg
      t.json :choices
      t.timestamps
    end
  end
end
