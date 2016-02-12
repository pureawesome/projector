require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'belongs to project' do
    project = FactoryGirl.build(:project)
    task = project.tasks.build(name: 'Teset Task', due_date: '2/2/16')

    expect(task.project).to eq(project)

    it { is_expected.to have_db_column(:project_id) }
  end
end
