require 'rails_helper'

RSpec.feature 'Editing task on a project' do
  scenario 'succeeds and shows up on the project page' do
    project = FactoryGirl.create(:project)

    visit project_url(project)

    click_link 'Create a new task'
    expect(page.current_url).to eq(new_project_task_url(project))

    fill_in 'task_name', with: 'Test Task'
    fill_in 'task_due_date', with: '1/1/16'
    click_button 'Create Task'

    expect(page.current_url).to eq(project_task_url(project, Task.last))
    click_link 'Edit Task'

    fill_in 'task_name', with: 'Edited Task Name'
    click_button 'Update Task'

    expect(page).to have_content('Edited Task Name')
    expect(page).to have_content('Task successfully updated.')

    click_link 'Back to Project'
    expect(page).to have_content('Edited Task Name')
    expect(page.current_url).to eq(project_url(project))
  end
end
