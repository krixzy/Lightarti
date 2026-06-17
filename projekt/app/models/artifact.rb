class Artifact < ApplicationRecord
  belongs_to :folder
  has_one :user
  validates :name, presence: true
  validates :storage_key, presence: true
end
