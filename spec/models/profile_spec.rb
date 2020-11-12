require 'rails_helper'
describe Profile do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール情報新規登録' do
    context '新規登録がうまくいくとき' do
      it "favorite_foodとmyselfが存在すれば登録できる" do
        expect(@profile).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "favorite_foodが空だと登録できない" do
        @profile.favorite_food = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("好きな食べ物を入力してください")
      end
      it "myselfが空だと登録できない" do
        @profile.myself = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("プロフィールを入力してください")
      end
    end
  end
end
