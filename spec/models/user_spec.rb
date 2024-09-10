require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nickname, email, password, password_confirmationがすべて入力されていれば、登録できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do

      end
      it "emailが空だと登録できない" do

      end
      it "重複したemailは登録できない" do

      end
      it "@を含まないemailは登録できない" do
        
      end
      it "passwordが空だと登録できない" do

      end
      it "passwordは5文字以下では登録できない" do

      end
      it "passwordは129文字以上では登録できない" do

      end
      it "passwordとpassword_confirmationは同じでないと登録できない" do

      end
    end
  end
end
