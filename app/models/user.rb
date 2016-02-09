class User < ActiveRecord::Base
  validates_presence_of :first_name
  has_many :tasks
end
