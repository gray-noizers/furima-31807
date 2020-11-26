class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    with_options presence: true do
        validates :image
        validates :title
        validates :intro
        validates :category_id
        validates :condition_id
        validates :delivery_id
        validates :prefecture_id
        validates :daycount_id
        validates :user
    end

    validates :price, numericality:{
        greater_than_or_equal_to: 300,
        less_than: 9999999
    }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{8,128}+\z/i } 
end
