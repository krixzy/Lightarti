class User < ApplicationRecord
  has_secure_password
  has_many :folder_permissions, dependent: :destroy
  has_many :folders, through: :folder_permissions

  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
