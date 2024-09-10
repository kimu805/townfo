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
        expect(@group.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @group.description = ""
        @group.valid?
        expect(@group.errors.full_messages).to include("Description can't be blank")
      end
      it "owner_idが空では登録できない" do
        @group.owner_id = ""
        @group.valid?
        expect(@group.errors.full_messages).to include("Owner can't be blank")
      end
    end
  end
end
