module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in 'メールアドレス <必須>', with: @user.email
    fill_in 'パスワード <必須>', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end