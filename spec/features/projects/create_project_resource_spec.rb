require 'rails_helper'

RSpec.feature 'Creating a new project', type: :feature do
  scenario 'with resources' do
    visit '/projects'
    click_link 'New Project'

    expect(current_url).to eq(new_project_url)

    fill_in 'project_name', with: 'Test Project'
    fill_in 'project_description', with: 'Test Project Description'
    fill_in 'project_start_date', with: '1/1/15'
    fill_in 'project_end_date_projected', with: '12/31/15'
    fill_in 'project_budget', with: 3000
    click_button 'Create Project'

    expect(current_path).to eq(project_path(Project.last))
    expect(page).to have_content('Test Project')
    expect(page).to have_content('Project successfully created.')
  end
end
