# require 'rails_helper'
#
# RSpec.feature 'Creating a new user', type: :feature do
#   scenario 'succeeds with valid values' do
#     visit '/users'
#     click_link 'New User'
#
#     expect(current_url).to eq(new_user_url)
#
#     fill_in 'user_name', with: 'Test User Name'
#     fill_in 'user_email', with: 'test@test.com'
#     select 'Admin', :from => 'Role'
#     select 'Active', :from => 'Status'
#     click_button 'Create User'
#
#     expect(current_path).to eq(user_path(User.last))
#     expect(page).to have_content('Test User')
#     expect(page).to have_content('User successfully created.')
#   end
#
#   scenario 'fails if the name is not provided' do
#     visit '/users'
#     click_link 'New User'
#
#     expect(current_path).to eq(new_user_path)
#
#     fill_in 'user_name', with: ''
#     click_button 'Create User'
#
#     expect(current_path).to eq(users_path)
#     expect(page).to have_content('error')
#   end
# end
