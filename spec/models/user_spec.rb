require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @project1 = FactoryGirl.build(:project)
  end
  it 'has a valid factory' do
    expect(@project1).to be_valid
  end

  it { is_expected.to have_db_column(:first_name) }
  it { is_expected.to have_db_column(:last_name) }
  it { is_expected.to have_db_column(:email) }
  it { is_expected.to have_db_column(:role) }
  it { is_expected.to have_db_column(:status) }

end
