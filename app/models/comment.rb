class Comment < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :notice

  # validation
  validates :text, presence: true, length: { maximum: 1000 }
end
