require 'rails_helper'

RSpec.feature 'Listing all projects', type: :feature do
  scenario 'returns a message when there are no projects to view' do
    visit '/'
    click_link 'Projects'

    expect(current_url).to eq(projects_url)
    expect(page).to have_content('0 projects')
  end

  scenario 'it displays the projects' do
    project1 = Project.create!(name: 'Test Project 1', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')
    project2 = Project.create!(name: 'Test Project 2', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')
    project3 = Project.create!(name: 'Test Project 3', description: 'The new test project', start_date: '2016-01-01', end_date_projected: '2016-02-01', end_date_actual: '2016-02-10',budget: '10000.00', cost: '11000.00')

    visit '/'
    click_link 'Projects'

    expect(current_url).to eq(projects_url)
    expect(page).to have_content('3 projects')
    expect(page).to have_content(project1.name)
    expect(page).to have_content(project2.name)
    expect(page).to have_content(project3.name)
    # expect(page).to have_content(project1.description)
    # expect(page).to have_content(project2.start_date)
    # expect(page).to have_content(project2.budget)
    # expect(page).to have_content(project3.end_date_projected_date)
    # expect(page).to have_content(project2.end_date_actual)
    # expect(page).to have_content(project3.cost)
  end
end
