require 'rails_helper'

RSpec.describe Booking do
  it { is_expected.to have_db_column(:project_id) }
  it { is_expected.to have_db_column(:resource_id) }

  it { is_expected.to belong_to(:project) }
  it { is_expected.to belong_to(:resource) }
end
