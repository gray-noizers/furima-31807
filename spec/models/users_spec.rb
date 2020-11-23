require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(
        nickname: "", family_name: "佐藤", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "ak690104", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "family_nameが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "ak690104", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "first_nameが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "ak690104", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "family_name_furiganaが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "二郎", family_name_furigana: "", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "ak690104", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "first_name_furiganaが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "",
        password: "ak690104", password_confirmation: "ak690104", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "passwordが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "", password_confirmation: "ak690104", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "password_confirmationが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "password_confirmationがpasswordと一致していないと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "some1010", birthday: "1999/12/25",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "birthdayが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "ak690104", birthday: "",
        email: "hankun970104@gmail.com")
      user.valid?
    end

    it "emailが空だと登録できない" do
      user = User.new(
        nickname: "しばゆー", family_name: "佐藤", first_name: "二郎", family_name_furigana: "サトウ", first_name_furigana: "ジロウ",
        password: "ak690104", password_confirmation: "ak690104", birthday: "1999/12/25",
        email: "")
      user.valid?
      binding.pry
    end

  end

end
