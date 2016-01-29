require 'rails_helper'

RSpec.feature 'Listing all users', type: :feature do
  scenario 'returns a message when there are no users to view' do
    visit '/'
    click_link 'Users'
        
    expect(page.current_url).to eq(users_url)
    expect(page).to have_content('0 users')
  end
end