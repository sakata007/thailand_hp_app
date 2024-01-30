class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :site_name,null: false, limit: 255
      t.string :top_img, limit: 255
      t.text :privacy_policy

      t.timestamps
    end
  end
end
