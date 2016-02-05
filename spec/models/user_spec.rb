require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @project1 = FactoryGirl.build(:project)
  end
  it 'has a valid factory' do
    expect(@project1).to be_valid
  end
  it { is_expected.to have_db_column(:first_name) }

  it 'should have a last name field' do
    expect(@user1.last_name).to eq('Test Last')
  end
  it 'should have a email field' do
    expect(@user1.email).to eq('test@test.com')
  end
  it 'should have a role field' do
    expect(@user1.role).to eq(1)
  end
  it 'should have a status field' do
    expect(@user1.role).to eq(1)
  end
end
