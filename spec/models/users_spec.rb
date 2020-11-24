require 'rails_helper'

RSpec.describe User, type: :model do

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
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "family_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name = ""
        user.valid?
        expect(user.errors.full_messages).to include("Family name can't be blank")
      end

      it "family_nameが全角仮名漢字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name = "test"
        user.valid?
        expect(user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_nameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = ""
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが全角仮名漢字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = "test"
        user.valid?
        expect(user.errors.full_messages).to include("First name is invalid")
      end

      it "family_name_furiganaが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name_furigana = ""
        user.valid?
        expect(user.errors.full_messages).to include("Family name furigana can't be blank")
      end

      it "family_name_furiganaが半角英数字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.family_name_furigana = "あああああああ"
        user.valid?
        expect(user.errors.full_messages).to include("Family name furigana is invalid")
      end

      it "first_name_furiganaが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name_furigana = ""
        user.valid?
        expect(user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it "first_name_furiganaが半角英数字以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name_furigana = "あああああああ"
        user.valid?
        expect(user.errors.full_messages).to include("First name furigana is invalid")
      end

      it "passwordが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.password = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下だと登録できない" do
        user = FactoryBot.build(:user)
        user.password = "12345a"
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角英数字混同出ないと登録できない" do
        user = FactoryBot.build(:user)
        user.password = "あえいうえおあお"
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid")
      end

      it "password_confirmationが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "password_confirmationがpasswordと一致していないと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = "xyz789"
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "birthdayが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.birthday = ""
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "emailが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.email = ""
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it "メールアドレスは一意性である必要がある" do
        user = FactoryBot.build(:user)
        user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailには@が含まれている必要がある" do
        user = FactoryBot.build(:user)
        user.email = "test.example"
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end

  end
  
  
end
