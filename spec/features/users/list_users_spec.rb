require 'rails_helper'

RSpec.feature 'Listing all users', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario 'it displays the users' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)

    visit '/'
    click_link 'Users'

    expect(current_url).to eq(users_url)
    expect(page).to have_content('4 users')
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user3.name)
  end


end
