require 'rails_helper'

RSpec.describe 'Project', type: :model do
  before(:each) do
    @project1 = Project.new( name: 'Test Project 1', 
                            description: 'The new test project', 
                            start_date: '2016-01-01', 
                            end_date_projected: '2016-02-01', 
                            end_date_actual: '2016-02-10',
                            budget: 10000.00, 
                            cost: 11000.00)
  end
  it 'should have a name field' do
    expect(@project1.name).to eq('Test Project 1')
  end
  it 'should have a description field' do
    expect(@project1.description).to eq('The new test project')
  end
  it 'should have a start_date field' do
    expect(@project1.start_date).to eq('2016-01-01')
  end
  it 'should have a end_date_projected field' do
    expect(@project1.end_date_projected).to eq('2016-02-01')
  end
  it 'should have a end_date_actual field' do
    expect(@project1.end_date_actual).to eq('2016-02-10')
  end
  it 'should have a budget field' do
    expect(@project1.budget).to eq(10000.00)
  end
  it 'should have a cost field' do
    expect(@project1.cost).to eq(11000.00)
  end
end