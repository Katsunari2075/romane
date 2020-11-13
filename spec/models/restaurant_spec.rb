require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before do
    @restaurant = FactoryBot.build(:restaurant)
  end

  describe '投稿保存' do
    context "投稿が保存できるとき" do
      it "store_name,genre_id,rating_id,descriptionがあれば保存できること" do
        expect(@restaurant).to be_valid
      end
      it "store_nameが空では保存できないこと" do
        @restaurant.store_name = nil
        @restaurant.valid?
        expect(@restaurant.errors.full_messages).to include("店名を入力してください")
      end
      it "genre_idは2以上でないと保存できないこと" do
        @restaurant.genre_id = 1
        @restaurant.valid?
        expect(@restaurant.errors.full_messages).to include("ジャンルのーーは一覧にありません")
      end
      it "rating_idは2以上でないと保存できないこと" do
        @restaurant.rating_id = 1
        @restaurant.valid?
        expect(@restaurant.errors.full_messages).to include("評価のーーは一覧にありません")
      end
      it "descriptionがからでは保存できないこと" do
        @restaurant.description = nil
        @restaurant.valid?
        expect(@restaurant.errors.full_messages).to include("説明を入力してください")
      end
    end
  end
end
