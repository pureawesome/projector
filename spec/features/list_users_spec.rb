require 'rails_helper'

RSpec.feature 'Listing all users', type: :feature do
  scenario 'returns a message when there are no users to view' do
    visit '/'
    click_link 'Users'

    expect(current_url).to eq(users_url)
    expect(page).to have_content('0 users')
  end

  scenario 'it displays the users' do
    user1 = User.create!(  first_name: 'Test First', last_name: 'First Last', email: 'test@test.com', role: 1, status: 1)
    user2 = User.create!(  first_name: 'Test Second', last_name: 'Second Last', email: 'test@test.com', role: 1, status: 1)
    user3 = User.create!(  first_name: 'Test Third', last_name: 'Third Last', email: 'test@test.com', role: 1, status: 1)

    visit '/'
    click_link 'Users'

    expect(current_url).to eq(users_url)
    expect(page).to have_content('3 users')
    expect(page).to have_content(user1.first_name)
    expect(page).to have_content(user2.first_name)
    expect(page).to have_content(user3.first_name)
  end


end
