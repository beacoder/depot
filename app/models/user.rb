class User < ApplicationRecord

  # [117] update: rollback deletion if last user has been deleted
  # declare ensure_an_admin_remains() to be called after the "SQL delete" executed
  # last user deleted => exception raised => transaction rolled back
  after_destroy :ensure_an_admin_remains

  # [95] update: add validation for User
  validates :name, presence: true, uniqueness: true

  has_secure_password

  # [115] update: define an exception class
  class Error < StandardError
  end

  private
  # [116] update: add function to check if last user has been deleted
  # if it is then raise an exception
  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
