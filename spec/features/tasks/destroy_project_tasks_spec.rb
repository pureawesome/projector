require 'rails_helper'

RSpec.feature 'Destroys a task for project' do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  before(:each) do
    @project = FactoryGirl.create(:project)
  end

  scenario 'via the project task list' do
    visit project_url(@project)

    click_link 'Create a new task'
    expect(page.current_url).to eq(new_project_task_url(@project))

    fill_in 'task_name', with: 'Test Task'
    fill_in 'task_due_date', with: '1/1/16'
    click_button 'Create Task'

    expect(page.current_url).to eq(project_task_url(@project, Task.last))
    click_link 'Back to Project'

    expect(page.current_url).to eq(project_url(@project))
    find(:css, '.glyphicon-trash').click

    expect(page).to have_content('0 assigned tasks')
    expect(page).to have_content('Task successfully destroyed')
  end
end
