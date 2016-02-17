require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'belongs to project' do
    project = FactoryGirl.build(:project)
    task = project.tasks.build(name: 'Teset Task', due_date: '2/2/16')

    expect(task.project).to eq(project)
  end

  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:description) }
  it { is_expected.to have_db_column(:start_date) }
  it { is_expected.to have_db_column(:due_date) }
  it { is_expected.to have_db_column(:status) }

  it { is_expected.to have_db_column(:project_id) }
  it { is_expected.to have_db_column(:user_id) }

  it { is_expected.to belong_to(:project) }
  it { is_expected.to belong_to(:user) }
end
