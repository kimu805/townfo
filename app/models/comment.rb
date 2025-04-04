class Comment < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :notice

  # validation
  validates :text, presence: true, length: { minimum: 1, maximum: 1000 }
end
