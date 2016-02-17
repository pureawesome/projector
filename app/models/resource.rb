class Resource < ActiveRecord::Base
  has_many :enablements
  has_many :projects, through: :enablements

  validates_presence_of :name
end
