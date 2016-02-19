require 'rails_helper'

RSpec.feature 'User sign out' do
  scenario 'is successful' do
    @user = FactoryGirl.create(:user)

    sign_in(@user)

    visit root_path

    click_link 'Sign Out'

    expect(current_path).to eq(landing_path)
    expect(page).to have_content('signed out')
  end
end
