class ModifyProducts < ActiveRecord::Migration[7.1]
  def change
        # NOT NULLに変更
        change_column :products, :name, :string, null: false
        change_column :products, :summary, :text, null: false
        change_column :products, :sold_out_flg, :boolean, null: false
        change_column :products, :choices, :json, null: false

        # sold_out_flgのデフォルト値をfalseに変更
        change_column_default :products, :sold_out_flg, false
    
        # 新しいfast_shipping_flgカラムを追加
        add_column :products, :fast_shipping_flg, :boolean, null: false, default: false

  end
end
