class Order
    include ActiveModel::Model
    include ActiveModel::Attributes
    
    attr_accessor :name, :address, :date, :email, :phone_number, :select

    # MEMO:オーダー関連のバリデーションはここに記載
end