require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報新規登録' do
    context '新規登録がうまくいくとき' do
      it "nameとemail,passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@が含まれていれば登録できること" do
        @user.email = "aaaa@aaaa"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上であれば登録できること" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに@が入っていないと登録できない" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "bbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
