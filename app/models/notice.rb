class Notice < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :reads, as: :readable, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag

  with_options presence: true do
    validates :title
    validates :content
    validates :tag_id, numericality: { other_than: 1, message:"を入力してください"}
  end
end
