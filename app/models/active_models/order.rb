class Order
    include ActiveModel::Model
    include ActiveModel::Attributes
    
    attr_accessor :name, :address, :date, :email, :phone_number, :select

    # MEMO:オーダー関連のバリデーションはここに記載  
    #オーダー画面（index）
    validates :name, presence:true, length: { maximum: 30 }
    validates :address, presence:true, length: { maximum: 255 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 320 },
                      format: { with: VALID_EMAIL_REGEX }
    validate :validate_select_items

    private

    def validate_select_items

      # puts '---ここが商品バリデーション-----'
      # puts choices
      # puts '--------'

      if choices.present? 
        errors.add(:base, "Please select at least one item")
      end

    end



end
  
  