class Circular < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_one_attached :pdf_file
  has_many :reads, as: :readable, dependent: :destroy

  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :pdf_file
  end

  scope :recent, -> { order("created_at DESC") }
  scope :selected_year, ->(selected_year) { where("EXTRACT(YEAR FROM created_at) = ?", selected_year) }
end
