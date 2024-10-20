class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :notice

  validates :text, presence: true, length: { maximum: 1000 }
end
