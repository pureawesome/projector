require 'rails_helper'

RSpec.describe 'User', type: :model do
  before(:each) do
    @user1 = User.new(  first_name: 'Test First', 
                        last_name: 'Test Last', 
                        email: 'test@test.com', 
                        role: 1, 
                        status: 1)
  end
  it 'should have a first name field' do
    expect(@user1.first_name).to eq('Test First')
  end
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