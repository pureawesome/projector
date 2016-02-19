class User < ActiveRecord::Base
  has_many :tasks

  validates :first_name, presence: true
end
