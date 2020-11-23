require 'rails_helper'
describe ItemsController, type: :request do

  before do
    @user = FactoryBot.create(:user)
  end

  describe "POST #create" do
    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
      #post users_path(@user)
      #expect(response.status).to eq 200
    end
end
