class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    with_options presence: true do
        validates :image
        validates :title
        validates :intro

        with_options numericality: { other_than: 1 } do
            validates :category_id
            validates :condition_id
            validates :delivery_id
            validates :prefecture_id
            validates :daycount_id
        end
        
        validates :price, numericality: {
            greater_than_or_equal_to: 300,
            less_than_or_equal_to: 9999999},
            format: { with: /\A(?=.*?\d)[\w-]+\z/i } 
    end

    
end
