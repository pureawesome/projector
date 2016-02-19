class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
end
