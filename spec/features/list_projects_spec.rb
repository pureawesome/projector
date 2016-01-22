require 'rails_helper'

RSpec.feature 'Listing all projects' do
  scenario 'returns a message when there are no projects to view' do
    visit '/'
    click_link 'Projects'
        
    expect(page.current_url).to eq(projects_url)
    expect(page).to have_content('0 projects')
  end
end