class Circular < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_one_attached :pdf_file
end
