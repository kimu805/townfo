require 'rails_helper'

RSpec.describe Circular, type: :model do
  before do
    @circular = FactoryBot.build(:circular)
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
        @circular.pdf_file = ""
        @circular.valid?
        binding.pry
        expect(@circular.errors.full_messages).to include("pdf_file can't be blank")
      end
    end
  end
end
