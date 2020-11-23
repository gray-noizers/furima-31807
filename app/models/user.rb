class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: [ぁ-んァ-ン一-龥]}
    validates :first_name format: { with: [ぁ-んァ-ン一-龥]}
    validates :family_name_furigana, format: { with: [ア-ン]}
    validates :first_name_furigana, format: { with: [ア-ン]}
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }, format: { with: /^(?=.*?[a-z])(?=.*?\d)[a-z\d]$/i } 
    validates :password_confirmation
    validates :birthday
  end
end

