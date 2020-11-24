require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "ユーザー管理機能ができる時" do
    it "全ての要素が記入されていれば登録できる" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

  end

    

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

      it "family_nameが全角仮名漢字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name = "test"
        user.valid?
      end

      it "first_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = ""
        user.valid?
      end

      it "first_nameが全角仮名漢字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = "test"
        user.valid?
      end

      it "family_name_furiganaが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name_furigana = ""
        user.valid?
      end

      it "family_name_furiganaが半角英数字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name_furigana = "あああああああ"
        user.valid?
      end

      it "first_name_furiganaが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name_furigana = ""
        user.valid?
      end

      it "first_name_furiganaが半角英数字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name_furigana = "あああああああ"
        user.valid?
      end

      it "passwordが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.password = ""
        user.valid?
      end

      it "passwordが5文字以下だと登録できない" do
        user = FactoryBot.build(:user)
        user.password = "12345a"
        user.valid?
      end

      it "passwordが半角英数字混同出ないと登録できない" do
        user = FactoryBot.build(:user)
        user.password = "あえいうえおあお"
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

      it "メールアドレスは一意性である必要がある" do
        user = FactoryBot.build(:user)
        user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
      end

      it "emailには@が含まれている必要がある" do
        user = FactoryBot.build(:user)
        user.email != "[@]"
        user.valid?
      end

  end
  
  

end
