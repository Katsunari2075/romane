require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @profile = FactoryBot.build(:profile)
  end
  context 'ユーザー新規登録できるとき' do
    it '正しい情報を入力すれば新規登録ができてトップページに遷移する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('sign up')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ユーザー名 <必須>', with: @user.name
      fill_in 'メールアドレス <必須>', with: @user.email
      fill_in 'パスワード <必須>', with: @user.password
      fill_in 'パスワード確認 <必須>', with: @user.password_confirmation
      # Nextボタンをクリックする
      find('input[name="commit"]').click
      #プロフィール情報を入力する
      fill_in '好きな食べ物 <必須>', with: @profile.favorite_food
      fill_in '嫌いな食べ物', with: @profile.hated_food
      fill_in 'プロフィール <必須>', with: @profile.myself
      # sign upボタンを押すとユーザーモデルとプロフィールモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # トップページにlog outボタンがあることを確認する 
      expect(page).to have_content('log out')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('sign up')
      expect(page).to have_no_content('log in')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報では新規登録ができずにユーザー情報入力ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('sign up')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ユーザー名 <必須>', with: ""
      fill_in 'メールアドレス <必須>', with: ""
      fill_in 'パスワード <必須>', with: ""
      fill_in 'パスワード確認 <必須>', with: ""
      # Nextボタンをクリックする
      find('input[name="commit"]').click
      # ユーザー情報ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
    it '誤った情報では新規登録でずプロフィール情報入力ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('sign up')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ユーザー名 <必須>', with: @user.name
      fill_in 'メールアドレス <必須>', with: @user.email
      fill_in 'パスワード <必須>', with: @user.password
      fill_in 'パスワード確認 <必須>', with: @user.password_confirmation
      # Nextボタンをクリックする
      find('input[name="commit"]').click
      #プロフィール情報を入力する
      fill_in '好きな食べ物 <必須>', with: ""
      fill_in '嫌いな食べ物', with: ""
      fill_in 'プロフィール <必須>', with: ""
      # Sign upボタンをクリックする
      find('input[name="commit"]').click
      # プロフィール情報入力ページへ戻されることを確認する
      expect(current_path).to eq "/profiles"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできるとき' do
    it '保存されているユーザの情報と合致すればログインできる' do
      # トップページに移動する
      visit root_path
      # トップページにlog inボタンがあることを確認する
      expect(page).to have_content('log in')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'メールアドレス <必須>', with: @user.email
      fill_in 'パスワード <必須>', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # log outボタンがあることを確認する
      expect(page).to have_content('log out')
      # sign upボタンやlog inボタンが表示されていないことを確認する
      expect(page).to have_no_content('sign up')
      expect(page).to have_no_content('log in')
    end
  end
  context 'ログインできないとき' do
    it '保存されているユーザーの情報と合致しないとログインできない' do
      # トップページに移動する
      visit root_path
      # トップページにlog inボタンがあることを確認する
      expect(page).to have_content('log in')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス <必須>', with: ""
      fill_in 'パスワード <必須>', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq "/users/sign_in"
    end
  end
end
