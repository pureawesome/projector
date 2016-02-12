class Enablement < ActiveRecord::Base
  belongs_to :project
  belongs_to :resource
end
