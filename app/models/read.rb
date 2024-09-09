class Read < ApplicationRecord
  belongs_to :user
  belongs_to :readable, polymorphic: true
end
