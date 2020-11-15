require 'rails_helper'

RSpec.describe "レストラン投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @restaurant = FactoryBot.create(:restaurant)
  end
  context 'レストラン情報が投稿できるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス <必須>', with: @user.email
      fill_in 'パスワード <必須>', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_restaurant_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('restaurant[images][]', image_path, make_visible: true)
      # フォームに情報を入力する
      fill_in '店名', with: @restaurant.store_name
      fill_in '住所', with: @restaurant.address
      find("#restaurant_genre_id").find("option[value='2']").select_option
      find("#restaurant_rating_id").find("option[value='2']").select_option
      fill_in '説明', with: @restaurant.description
      # 送信するとRestaurantモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Restaurant.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
    end
  end
  context 'レストラン情報が投稿できないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end