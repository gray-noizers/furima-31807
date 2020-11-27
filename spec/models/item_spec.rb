require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
  
    context "新規出品ができるとき" do
      it "全ての情報が記入されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
  

    context "新規出品ができないとき" do
      it "画像が添付されていないと保存されない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が入力されていないと保存されない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it "商品説明が入力されていないと保存されない" do
        @item.intro = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Intro can't be blank")
      end

      it "カテゴリーが選択されていないと保存されない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "カテゴリーが1だと保存されない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品状態が選択されていないと保存されない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "商品状態が1だと保存されない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料の負担が選択されていないと保存されない" do
        @item.delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end

      it "配送料の負担が1だと保存されない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it "配送先が選択されていないと保存されない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "配送先が1だと保存されない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数が選択されていないと保存されない" do
        @item.daycount_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Daycount can't be blank")
      end

      it "発送までの日数が1だと保存されない" do
        @item.daycount_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Daycount must be other than 1")
      end

      it "価格が入力されていないと保存されない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300円未満だと保存されない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が9,999,999円を超えると保存されない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "価格に半角数字以外が入力されていると保存されない" do
        @item.price = "test"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end


  end

end
