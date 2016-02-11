require 'rails_helper'

RSpec.feature 'Adding tasks to a project' do
  scenario 'succeeds' do
    project1 = Project.create!(name: 'Task Project 1', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')
    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link 'Task Project 1'
    expect(page.current_url).to eq(project_url(project1))

    click_link 'Create a new task'
    expect(page.current_url).to eq(new_project_task_url(project1))

    fill_in 'task_name', with: 'Test Task'
    click_button 'Create Task'

    expect(page.current_url).to eq(project_task_url(project1, Task.last))
    click_button 'Back to Project'
    expect(page.current_url).to eq(project_url(project1))

  end
end
