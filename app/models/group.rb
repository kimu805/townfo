class Group < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :owner_id
  end
end
