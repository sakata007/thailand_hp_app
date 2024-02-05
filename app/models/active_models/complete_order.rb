class CompleteOrder
    include ActiveModel::Model
    
    attr_accessor :order_products, :total_price, :customer_name, :customer_shipping_address, :customer_delivery_date, :customer_delivery_time, :customer_email, :customer_phone_number

    # MEMO:オーダー関連のバリデーションはここに記載
end