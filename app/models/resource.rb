class Resource < ActiveRecord::Base
  has_many :enablements
  has_many :projects, through: :enablements

  validates :name, presence: true
end
