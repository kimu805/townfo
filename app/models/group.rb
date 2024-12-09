class Group < ApplicationRecord
  # association
  has_many :notices, dependent: :destroy
  has_many :circulars, dependent: :destroy
  ## 承認済みのユーザーとの関連付け
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user
  ## 承認待ちのユーザーとの関連付け
  has_many :pending_memberships, dependent: :destroy
  has_many :pending_users, through: :pending_memberships, source: :user


  # validation
  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :description, length: { maximum: 2000 }
    validates :owner_id
  end

  # ransack
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

end
