require 'rails_helper'

RSpec.feature 'Listing all projects', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario 'returns a message when there are no projects to view' do
    visit '/'
    click_link 'Projects'

    expect(current_url).to eq(projects_url)
    expect(page).to have_content('0 projects')
  end

  scenario 'it displays the projects' do
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)
    project3 = FactoryGirl.create(:project)

    visit '/'
    click_link 'Projects'

    expect(current_url).to eq(projects_url)
    expect(page).to have_content('3 projects')
    expect(page).to have_content(project1.name)
    expect(page).to have_content(project2.name)
    expect(page).to have_content(project3.name)
  end
end
