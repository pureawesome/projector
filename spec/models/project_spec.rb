require 'rails_helper'

RSpec.describe 'Project', type: :model do
  it 'should have a name field' do
    project1 = Project.new(name: 'Test Project 1')
    
    expect(project1.name).to eq('Test Project 1')
  end
  it 'should have a description field' do
  end
  it 'should have a start_date field' do
  end
  it 'should have a end_date_projected field' do
  end
  it 'should have a end_date_actual field' do
  end
  it 'should have a budget field' do
  end
  it 'should have a cost field' do
  end
end