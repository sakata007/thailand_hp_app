class Product < ApplicationRecord
    has_one_attached :image

    # MEMO:管理者関連のバリデーションはここに記載


    # HP設定画面（導入後）
    
    
    # 管理画面＿新規登録
    validates :name, presence:true
    validates :summary, presence:true

    # validates :カラム名, numericality: true  数値のみが使われているかのバリデーション

    #TODO choicesのjsonに沿ったバリデーションを組む


    # その他のモデル定義...
  

    
    # 管理画面＿商品一覧（導入後）
    
    
    # 管理画面＿編集・削除（導入後）
    
    
    # 管理画面＿問い合わせ先設定画面（導入後）


end
