require 'rails_helper'

RSpec.feature 'Adding tasks to a project' do
  scenario 'succeeds and shows up on the project page' do
    project = FactoryGirl.create(:project)

    visit project_url(project)

    click_link 'Create a new task'
    expect(page.current_url).to eq(new_project_task_url(project))

    fill_in 'task_name', with: 'Test Task'
    fill_in 'task_due_date', with: '1/1/16'
    click_button 'Create Task'

    expect(page.current_url).to eq(project_task_url(project, Task.last))
    expect(page).to have_content('Test Task')
    expect(page).to have_content(Task.last.due_date)

    click_link 'Back to Project'
    expect(page.current_url).to eq(project_url(project))
  end

  scenario 'fails if the name is not provided' do

    project = FactoryGirl.create(:project)

    visit project_url(project)

    click_link 'Create a new task'
    expect(page.current_url).to eq(new_project_task_url(project))

    fill_in 'task_name', with: ''
    fill_in 'task_due_date', with: '1/1/16'
    click_button 'Create Task'

    expect(page).to have_content('Task not saved')
  end

  scenario 'fails if the due date is not provided' do

    project = FactoryGirl.create(:project)

    visit project_url(project)

    click_link 'Create a new task'
    expect(page.current_url).to eq(new_project_task_url(project))

    fill_in 'task_name', with: 'Test Project Name'
    fill_in 'task_due_date', with: ''
    click_button 'Create Task'

    expect(page).to have_content('Task not saved')
  end
end
