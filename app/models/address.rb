class Address < ApplicationRecord
    belongs_to :order

    with_options presence: true do
        validates :postal_code, format: { with: ^\d{3}-\d{4}$ } 
        validates :city
        validates :banchi
        #validates :building
        validates :tel, length: { maximum: 11 },  format: { with: ^0\d{10}$ } 
    end
    validates :prefecture_id, numericality: { other_than: 0 }
end
