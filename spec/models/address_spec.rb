require 'rails_helper'

RSpec.describe Address, type: :model do
  context "購入ができる時" do
    it "全ての要素が記入されていれば登録できる" do
      order = FactoryBot.build(:address)
      expect(order).to be_valid
    end

    it "建物名が空でも登録できる" do
      order = FactoryBot.build(:address)
      order.building = ""
      expect(order).to be_valid
    end

  end
end
