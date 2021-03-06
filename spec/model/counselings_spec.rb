require 'rails_helper'

RSpec.describe Counseling, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "Userモデルに属している" do
      is_expected.to belong_to(:user)
    end
  end

  describe '実際に保存してみる' do
    context "保存できる場合" do
      it "user_idを入れて保存" do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:counseling, user_id: user.id)).to be_valid
      end
    end
    context "保存できない場合" do
      it "user_idを保存していない" do
        expect(FactoryBot.build(:counseling)).to_not be_valid
      end
      it "titleが空欄" do
        expect(FactoryBot.build(:counseling, :no_title)).to_not be_valid
      end
      it "bodyが空欄" do
        expect(FactoryBot.build(:counseling, :no_body)).to_not be_valid
      end
    
    end
  end
end