class Log
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture ,:banchi, :building, :tel, :city, :token, :user_id, :item_id

    with_options presence: true do
        validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ } 
        validates :city
        validates :banchi
        validates :token
        validates :tel, length: { maximum: 11 },  format: { with: /\A\d{11}\z/ } 
    end
    validates :prefecture, numericality: { other_than: 1 }

    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(postal_code: postal_code, prefecture: prefecture, city: city, banchi: banchi, building: building, tel: tel, order_id: order.id)
    end

end