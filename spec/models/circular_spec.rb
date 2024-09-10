require 'rails_helper'

RSpec.describe Circular, type: :model do
  before do
    @circular = FactoryBot.build(:circular)
    @circular.pdf_file.attach(io: File.open("public/images/表示確認用2.pdf"), filename: "表示確認用.pdf", content_type: "application/pdf")
  end

  describe "回覧板作成機能" do
    context "作成できる場合" do
      it "title, pdf_file, user, groupがあれば作成できる" do
        expect(@circular).to be_valid
      end
    end
    context "作成できない場合" do
      it "titleが空では作成できない" do
        @circular.title = ""
        @circular.valid?
        expect(@circular.errors.full_messages).to include("Title can't be blank")
      end
      it "pdf_fileが空では作成できない" do
        @circular.pdf_file = nil
        @circular.valid?
        expect(@circular.errors.full_messages).to include("Pdf file can't be blank")
      end
      it "userが紐づいていなければ作成できない" do
        @circular.user = nil
        @circular.valid?
        expect(@circular.errors.full_messages).to include("User must exist")
      end
      it "groupが紐づいていなければ作成できない" do
        @circular.group = nil
        @circular.valid?
        expect(@circular.errors.full_messages).to include("Group must exist")
      end
    end
  end
end
