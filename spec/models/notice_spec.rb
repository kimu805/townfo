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
      
    end
  end
end
