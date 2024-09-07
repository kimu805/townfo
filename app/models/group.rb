class Group < ApplicationRecord
    # 承認済みのユーザーとの関連付け
    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships, source: :user
  
    # 承認待ちのユーザーとの関連付け
    has_many :pending_memberships, dependent: :destroy
    has_many :pending_users, through: :pending_memberships, source: :user

  with_options presence: true do
    validates :name
    validates :description
    validates :owner_id
  end
end
