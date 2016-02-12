require 'rails_helper'

RSpec.feature 'Adding tasks to a project' do
  scenario 'succeeds and shows up on the project page' do
    project = FactoryGirl.create(:project)

    visit project_url(project)
    # click_link 'Projects'
    #
    # expect(page.current_url).to eq(projects_url)
    # click_link 'Task Project 1'
    # expect(page.current_url).to eq(project_url(project1))

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
end
