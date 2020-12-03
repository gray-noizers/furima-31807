class Address < ApplicationRecord
    belongs_to :order

    with_options presence: true do
        validates :postal_code
        validates :city
        validates :banchi
        #validates :building
        validates :tel, length: { maximum: 11 }
    end
    validates :prefecture_id, numericality: { other_than: 0 }
end
