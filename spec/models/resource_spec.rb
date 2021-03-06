require 'rails_helper'

RSpec.describe Resource, type: :model do
  before(:each) do
    @resource = FactoryGirl.build(:resource)
  end
  it 'has a valid factory' do
    expect(@resource).to be_valid
  end
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:description) }

  it { is_expected.to have_many(:bookings) }
  it { is_expected.to have_many(:projects) }
end
