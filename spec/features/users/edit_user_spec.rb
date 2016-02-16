require 'rails_helper'

RSpec.feature 'Edit a user', type: :feature do
  scenario 'succeeds with valid values' do
    visit '/users'
    click_link 'New User'

    expect(current_url).to eq(new_user_url)

    fill_in 'user_first_name', with: 'Test User First'
    fill_in 'user_last_name', with: 'Test User Last'
    fill_in 'user_email', with: 'test@test.com'
    select 'Admin', :from => 'Role'
    select 'Active', :from => 'Status'
    click_button 'Create User'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content('Test User')
    click_link 'Edit User'

    fill_in 'user_first_name', with: 'New Edit User First'
    click_button 'Update User'

    expect(page).to have_content('New Edit User First')
    expect(page).to have_content('User successfully updated.')
    expect(current_path).to eq(user_path(User.last))
  end

  scenario 'fails if the name is removed' do
    visit '/users'
    click_link 'New User'

    expect(current_url).to eq(new_user_url)

    fill_in 'user_first_name', with: 'Test User First'
    fill_in 'user_last_name', with: 'Test User Last'
    fill_in 'user_email', with: 'test@test.com'
    select 'Admin', :from => 'Role'
    select 'Active', :from => 'Status'
    click_button 'Create User'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content('Test User')
    click_link 'Edit User'

    expect(current_path).to eq(edit_user_path(User.last))
    fill_in 'user_first_name', with: ''
    click_button 'Update User'

    expect(page).to have_content('error')
  end
end
