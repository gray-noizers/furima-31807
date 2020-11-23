require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "ユーザー新規登録ができない時" do
      it "nicknameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.nickname = ""
        user.valid?
      end

      it "family_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name = ""
        user.valid?
      end

      it "first_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = ""
        user.valid?
      end

      it "family_name_furiganaが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name_furigana = ""
        user.valid?
      end

      it "first_name_furiganaが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name_furigana = ""
        user.valid?
      end

      it "passwordが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.password = ""
        user.valid?
      end

      it "password_confirmationが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = ""
        user.valid?
      end

      it "password_confirmationがpasswordと一致していないと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation != user.password
        user.valid?
      end

      it "birthdayが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.birthday = ""
        user.valid?
      end

      it "emailが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.email = ""
        user.valid?
      end

    end
  
  

end
