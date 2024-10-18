require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.build(:group, owner_id: @user.id)
  end

  describe "グループ新規作成機能" do
    context "新規作成できる場合" do
      it "name, description, owner_idがあれば新規作成できる" do
        expect(@group).to be_valid
      end
    end

    context "新規作成できない場合" do
      it "nameが空では登録できない" do
        @group.name = ""
        @group.valid?
        expect(@group.errors.full_messages).to include("グループ名を入力してください")
      end
      it "nameは51文字以上では登録できない" do
        @group.name = Faker::Lorem.characters(number: 51)
        @group.valid?
        expect(@group.errors.full_messages).to include("グループ名は50文字以内で入力してください")
      end
      it "descriptionが空では登録できない" do
        @group.description = ""
        @group.valid?
        expect(@group.errors.full_messages).to include("グループの説明を入力してください")
      end
      it "descriptionは2001文字以上では登録できない" do

      end
      it "owner_idが空では登録できない" do
        @group.owner_id = ""
        @group.valid?
        expect(@group.errors.full_messages).to include("グループの管理者を入力してください")
      end
    end
  end
end
