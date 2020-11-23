class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_furigana, presence: true
  validates :first_name_furigana, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :birthday, presence: true
end

#validates :nickname, presence: true, length: { maximum: 6 }
  #validates :password, presence: true, confirmation: true
  #validates :password_confirmation, presence: true
  #validates :family_name, presence: true,
  #validates :email, presence: true, uniqueness: true