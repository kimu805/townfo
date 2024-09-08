class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 承認済みのユーザーとの関連付け
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships, source: :group
  # 承認待ちのユーザーとの関連付け
  has_many :pending_memberships, dependent: :destroy
  has_many :pending_groups, through: :pending_memberships, source: :group
  has_many :notices

  validates :nickname, presence: true

end
