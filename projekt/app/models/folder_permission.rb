class FolderPermission < ApplicationRecord
  belongs_to :folder
  belongs_to :user
  ROLE_TYPES = %w[
      read
      write
      admin
    ].freeze

  validates :role, inclusion: { in: ROLE_TYPES }

  def can_edit?
    role == "admin" || role == "write"
  end

  def can_view?
    can_edit? || role == "read"
  end

  def admin?
    role == "admin"
  end
end
