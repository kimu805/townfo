require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, owner_id: @user.id)
    @notice = FactoryBot.create(:notice, user_id: @user.id, group_id: @group.id)
    @comment = FactoryBot.build(:comment, user_id: @user.id, notice_id: @notice.id)
  end

  describe "コメント投稿機能" do
    context "投稿できる場合" do
      it "text, user_id, notice_idが適切に入力されていれば、投稿できる" do
        expect(@comment).to be_valid
      end
    end
    context "投稿できない場合" do
      it "textが空では登録できない" do

      end
      it "textは1001文字以上では登録できない" do

      end
      it "user_idが紐づいていなければ登録できない" do

      end
      it "notice_idが紐づいていなければ登録できない" do

      end
    end
  end
end
