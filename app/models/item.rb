class Item < ApplicationRecord
    belongs_to :uer
    has_one_attached :image

    with_options presence: true do
        validates :title
        validates :intro, format: {with: /\A[ぁ-んァ-ン一-龥]/}
        validates :category_id, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
        validates :family_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
        validates :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
        validates :email, uniqueness: true
        validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{8,128}+\z/i } 
        validates :password_confirmation
        validates :birthday
    end
end
