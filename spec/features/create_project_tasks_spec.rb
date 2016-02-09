require 'rails_helper'

RSpec.feature 'Adding tasks to a project' do
  scenario 'succeeds' do
    project1 = Project.create!(name: 'Task Project 1', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')
    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link 'Task Project 1'
    expect(page.current_url).to eq(project_url(project1.id))

    click_link 'Create a new task'
    # expect(page.current_url).to eq()
  end
end
