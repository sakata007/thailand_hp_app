class Order
    include ActiveModel::Model
    include ActiveModel::Attributes
    
    attr_accessor :name, :address, :delivery_date, :delivery_time, :email, :phone_number, :select

    DELIVERY_TIME = [
        '10:00~12:00',
        '12:00~14:00',
        '14:00~16:00',
        '16:00~18:00',
        '18:00~20:00',
        '20:00~22:00',
        '22:00~23:00'
    ]

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
      if select.present? && select.values.all? { |value| value["price"].blank? && value["choice"].blank? }
        errors.add(:base, "Please select at least one item")
      end
    end



end
  
  