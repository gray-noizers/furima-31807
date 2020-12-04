class Address < ApplicationRecord
    belongs_to :order

    with_options presence: true do
        validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ } 
        validates :city
        validates :banchi
        validates :tel, length: { maximum: 11 },  format: { with: /\A\d{11}\z/ } 
    end
    validates :prefecture_id, numericality: { other_than: 0 }
end
