require 'rails_helper'

RSpec.describe "グループ新規作成", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.build(:group, owner_id: @user.id)
  end

  context "グループ作成できる時" do
    it "正しい情報を入力すればグループを作成できる" do
      sign_in(@user)
      click_on "グループを立ち上げる"
      expect(page).to have_current_path(new_group_path)
      fill_in "グループ名", with: @group.name
      fill_in "グループの説明", with: @group.description
      expect{
        click_on "作成"
        sleep 1
      }.to change {Group.count}.by(1)
      expect(page).to have_current_path(group_notices_path(@group))
    end
  end

  context "グループ作成できない時" do
    it "誤った情報を入力した場合グループを作成できない" do
      sign_in(@user)
      click_on "グループを立ち上げる"
      expect(page).to have_current_path(new_group_path)
      fill_in "グループ名", with: ""
      fill_in "グループの説明", with: ""
      expect{
        click_on "作成"
        sleep 1
      }.to change {Group.count}.by(0)
      expect(page).to have_current_path(new_group_path)
    end
  end
end
