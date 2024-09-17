module SignUpSupport
  def sign_up(user)
    visit new_user_registration_path
    fill_in "nickname", with: user.nickname
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    fill_in "password-confirmation", with: user.password
    expect{
      click_on "登録"
      sleep 1
    }.to change {User.count}.by(1)
    expect(page).to have_content("どちらかを選んで、townfoを始めよう！")
    expect(page).to have_content("ログアウト")
    expect(page).to have_no_content("新規登録")
    expect(page).to have_no_content("ログイン")
  end
end