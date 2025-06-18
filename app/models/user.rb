class User < ApplicationRecord
  has_many :repos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :slug, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
