require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
    @project1 = FactoryGirl.build(:project)
  end
  it 'has a valid factory' do
    expect(@project1).to be_valid
  end
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:description) }
  it { is_expected.to have_db_column(:start_date) }
  it { is_expected.to have_db_column(:end_date_projected) }
  it { is_expected.to have_db_column(:end_date_actual) }
  it { is_expected.to have_db_column(:budget) }
  it { is_expected.to have_db_column(:cost) }

  it { is_expected.to have_many(:bookings) }
  it { is_expected.to have_many(:resources) }

  it { is_expected.to validate_presence_of(:name) }
end
