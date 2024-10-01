class Circular < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_one_attached :pdf_file
  has_many :reads, as: :readable, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :pdf_file
  end

  scope :recent, -> {order("created_at DESC")}
end
