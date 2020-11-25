class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    with_options presence: true do
        validates :title
        validates :intro
        validates :category_id
        validates :condition_id
        validates :delivery_id
        validates :prefecture_id
        validates :daycount_id
        validates :price
        validates :user
    end
end
