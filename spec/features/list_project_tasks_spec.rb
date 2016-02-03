require 'rails_helper'

RSpec.feature 'Listing all tasks for project' do
  scenario 'returns a message when there are no tasks to view' do
    project1 = Project.create!(name: 'Test Project 1', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')
    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link 'Test Project 1'
    expect(page.current_url).to eq(project_url(project1.id))

    # click_link 'Tasks'
    # expect(page.current_url).to eq(project_tasks_url)
    expect(page).to have_content('0 tasks')
  end

  scenario 'returns a message when there are multiple tasks to view' do
    project1 = Project.create!(name: 'Test Project 1', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')

    task1 = Task.create!(name: 'Task 1', project_id: project1.id)
    task2 = Task.create!(name: 'Task 2', project_id: project1.id)
    task3 = Task.create!(name: 'Task 3', project_id: project1.id)

    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link 'Test Project 1'
    expect(page.current_url).to eq(project_url(project1.id))

    expect(page).to have_content('3 tasks')
    expect(page).to have_content('Task 3')
  end
end
