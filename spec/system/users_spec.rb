require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー新規登録ができる時" do
    it "正しい情報を入力すればユーザー新規登録ができてtownfoのスタート画面に移動する" do
      visit root_path
      click_on "新規登録"
      fill_in "nickname", with: @user.nickname
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      fill_in "password-confirmation", with: @user.password
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

  context "ユーザー新規登録ができないとき" do
    it "誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる" do
      visit root_path
      click_on "新規登録"
      fill_in "nickname", with: ""
      fill_in "email", with: ""
      fill_in "password", with: ""
      fill_in "password-confirmation", with: ""
      expect{
        click_on "登録"
        sleep 0
      }.to change {User.count}.by(0)
      expect(page).to have_content("新規ユーザー登録")
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "ログインできる時" do
    it "正しい情報を入力すればログインできてトップページに移動する" do
      visit root_path
      expect(page).to have_current_path(new_user_session_path)
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_current_path(root_path)
    end
  end

  context "ユーザー新規登録ができないとき" do
    it "誤った情報ではログインできずにログイン画面に戻ってくる" do
      visit root_path
      expect(page).to have_current_path(new_user_session_path)
      fill_in "email", with: ""
      fill_in "password", with: ""
      find('input[name="commit"]').click
      expect(page).to have_content("会員情報入力")
    end
  end
end
