class Product < ApplicationRecord
    has_one_attached :image

# MEMO:管理者関連のバリデーションはここに記載
    # HP設定画面（導入後）
    
    # 管理画面＿新規登録
    validates :name, presence:true
    validates :summary, presence:true  
    validate :validate_flag
    # validate :validate_choices

    # その他のモデル定義...
      
    # 管理画面＿商品一覧（導入後）
    
    # 管理画面＿編集・削除（導入後）

    # 管理画面＿問い合わせ先設定画面（導入後）

    private
    def validate_flag
        if fast_shipping_flg && sold_out_flg
          errors.add(:flag, " must be selected only.")
        end
    end

#  gramとpriceでnullを弾きたい （未実装）
    # def validate_choices
    #     # return unless choices.present?

    #     begin
    #         choices_hash = JSON.parse(choices, symbolize_names: true)
    #         # gram_value = choices_hash[:"1"][:gram]
    #         # gram_value = choices_hash["index"]["gram"]

    #     rescue JSON::ParserError
    #         errors.add(:choices, 'JSON format is invalid')
    #       return
    #     end

    #     puts '---------'
    #     puts choices_hash
    #     puts '---------'
    #     choices_hash.each do |el|
    #         if el[":gram"].blank?
    #             puts '---------'
    #             puts el
    #             # puts index
    #             puts '---------'
    #             errors.add(:base, "Please enter Gram for the element.")
    #         elsif el[":price"].blank?
    #             errors.add(:base, "Please enter Price for the element.")
    #         end
    #     end
    # end

end
