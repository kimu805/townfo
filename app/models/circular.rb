class Circular < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_one_attached :pdf_file

  with_options presence: true do
    validates :title
    validates :pdf_file
  end
end