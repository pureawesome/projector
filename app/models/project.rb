class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy # if you destroy project it'll destroy tasks
  has_many :enablements
  has_many :resources, through: :enablements

  validates :name, presence: true
end
