require 'rails_helper'

RSpec.describe Notice, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, owner_id: @user.id)
    @notice = FactoryBot.build(:notice, group_id: @group.id, user_id: @user.id)
  end

  describe "お知らせ投稿機能" do
    context "投稿できる場合" do
      it "title, content, schedule, tag_id, user, groupがあれば投稿できる" do
        expect(@notice).to be_valid
      end
      it "scheduleが空でも投稿できる" do
        @notice.schedule = ""
        expect(@notice).to be_valid
      end
    end
    context "投稿できない場合" do
      it "titleが空では登録できない" do
        @notice.title = ""
        @notice.valid?
        expect(@notice.errors.full_messages).to include("タイトルを入力してください")
      end
      it "contentが空では登録できない" do
        @notice.content = ""
        @notice.valid?
        expect(@notice.errors.full_messages).to include("内容を入力してください")
      end
      it "contentは1001文字以上では登録できない" do

      end
      it "tag_idが空では登録できない" do
        @notice.tag_id = nil
        @notice.valid?
        expect(@notice.errors.full_messages).to include("タグを入力してください")
      end
      it "userが紐づいていないと登録できない" do
        @notice.user_id = nil
        @notice.valid?
        expect(@notice.errors.full_messages).to include("ユーザーを入力してください")
      end
      it "groupが紐づいていないと登録できない" do
        @notice.group_id = nil
        @notice.valid?
        expect(@notice.errors.full_messages).to include("グループを入力してください")
      end
    end
  end
end
