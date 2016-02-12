class Resource < ActiveRecord::Base
  has_many :enablements
  has_many :projects, through: :enablements
end
