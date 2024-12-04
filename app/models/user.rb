class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :notices, dependent: :destroy
  has_many :circulars
  has_many :reads, dependent: :destroy
  has_many :comments, dependent: :destroy
  ## 承認済みのユーザーとの関連付け
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships, source: :group
  ## 承認待ちのユーザーとの関連付け
  has_many :pending_memberships, dependent: :destroy
  has_many :pending_groups, through: :pending_memberships, source: :group

  # validation
  validates :nickname, presence: true, length: { maximum: 30 }
  validates :profile, length: { maximum: 1000 }

end
