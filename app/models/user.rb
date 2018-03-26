class User < ApplicationRecord

  # [95] update: add validation for User
  validates :name, presence: true, uniqueness: true

  has_secure_password
end
