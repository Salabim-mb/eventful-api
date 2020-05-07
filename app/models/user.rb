class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates :email, uniqueness: true, case_sensitive: false

  has_secure_password
end
