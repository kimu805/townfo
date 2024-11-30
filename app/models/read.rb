class Read < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :readable, polymorphic: true
end
