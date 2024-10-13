class Notice < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :reads, as: :readable, dependent: :destroy
  has_many_attached :images
  has_many :comments, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag

  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :content, length: { maximum: 1000 }
    validates :tag_id, numericality: { other_than: 1, message:"を入力してください"}
  end

  def start_time
    schedule
  end

  scope :recent, -> { order("created_at DESC")}
end
