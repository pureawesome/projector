class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :name, presence: true
  validates :due_date, presence: true
  # TODO write test for due_date validation
end
