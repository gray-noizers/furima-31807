class Log
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipality ,:banchi, :building, :tel, :city, :token, :user_id, :item_id

    with_options presence: true do
        validates :postal_code
        validates :city
        validates :banchi
        validates :tel
    end
    validates :prefecture_id, numericality: { other_than: 0 }

    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, banchi: banchi, building: building, tel: tel, order_id: order.id)
    end

end