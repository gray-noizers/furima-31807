require 'rails_helper'

RSpec.describe Log, type: :model do
    before do 
        @buyer = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @log = FactoryBot.build(:log ,user_id: @buyer.id, item_id: @item.id)
    end

    context "購入ができる時" do
        it "全ての要素が記入されていれば登録できる" do
          expect(@log).to be_valid
        end
    
        it "建物名が空でも登録できる" do
          @log.building = ""
          expect(@log).to be_valid
        end
    end

    context "購入ができない時" do
        it "郵便番号は必須である" do
            @log.postal_code = ""
            @log.valid?
            expect(@log.errors.full_messages).to include("Postal code can't be blank")
        end

        it "郵便番号はハイフン必須である" do
            @log.postal_code = "0000000"
            @log.valid?
            expect(@log.errors.full_messages).to include("Postal code is invalid")
        end

        it "都道府県は選択必須である" do
            @log.prefecture_id = nil
            @log.valid?
            expect(@log.errors.full_messages).to include("Prefecture is not a number")
        end

        it "都道府県は0は選べない" do
            @log.prefecture_id = 0
            @log.valid?
            expect(@log.errors.full_messages).to include("Prefecture must be other than 0")
        end

        it "市区町村は選択必須である" do
            @log.city = ""
            @log.valid?
            expect(@log.errors.full_messages).to include("City can't be blank")
        end

        it "番地は選択必須である" do
            @log.banchi = ""
            @log.valid?
            expect(@log.errors.full_messages).to include("Banchi can't be blank")
        end

        it "電話番号は選択必須である" do
            @log.tel = ""
            @log.valid?
            expect(@log.errors.full_messages).to include("Tel can't be blank")
        end

        it "電話番号はハイフン不要である" do
            @log.tel = "000-0000-0000"
            @log.valid?
            expect(@log.errors.full_messages).to include("Tel is invalid")
        end

        it "電話番号は11桁以内である" do
            @log.tel = "000000000000"
            @log.valid?
            expect(@log.errors.full_messages).to include("Tel is invalid")
        end
        
    end
end
