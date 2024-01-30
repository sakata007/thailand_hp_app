class CreateShops < ActiveRecord::Migration[7.1]
  def change
    create_table :shops do |t|
      t.string :name,null: false, limit: 255
      t.text :summary
      t.text :detail
      t.string :email,null: false, limit: 100
      t.string :address, limit: 255
      t.string :phone_number, limit: 20

      t.timestamps
    end
  end
end
