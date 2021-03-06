class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :comments
  

  with_options presence: true do
    validates :nickname
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i } 
    validates :password_confirmation
    validates :birthday
  end
  
end

