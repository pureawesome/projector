require 'rails_helper'

RSpec.feature 'Listing all tasks for project' do
  scenario 'returns a message when there are no tasks to view' do
    project1 = Project.create!(name: 'Task Project 1', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')
    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link 'Task Project 1'
    expect(page.current_url).to eq(project_url(project1.id))

    # click_link 'Tasks'
    # expect(page.current_url).to eq(project_tasks_url)
    expect(page).to have_content('0 pending tasks')
  end

  scenario 'returns a message when there are multiple tasks to view' do
    project2 = Project.create!(name: 'Task Project 2', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')

    task1 = Task.create!(name: 'Task 1', project_id: project2.id)
    task2 = Task.create!(name: 'Task 2', project_id: project2.id)
    task3 = Task.create!(name: 'Task 3', project_id: project2.id)

    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link 'Task Project 2'
    expect(page.current_url).to eq(project_url(project2.id))

    expect(page).to have_content('3 pending tasks')
    expect(page).to have_content(task3.name)
    expect(page).to have_content(task2.name)
    expect(page).to have_content(task1.name)

  end
end
