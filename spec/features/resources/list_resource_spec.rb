require 'rails_helper'

RSpec.feature 'Listing all resources', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario 'returns a message when there are no resources' do
    visit '/'
    click_link 'Resources'

    expect(current_url).to eq(resources_url)
    expect(page).to have_content('0 Available Resources')
  end

  scenario 'it displays the resources' do
    resource1 = FactoryGirl.create(:resource)
    resource2 = FactoryGirl.create(:resource)
    resource3 = FactoryGirl.create(:resource)

    visit '/'
    click_link 'Resources'

    expect(current_url).to eq(resources_url)
    expect(page).to have_content('3 Available Resources')
    expect(page).to have_content(resource1.name)
    expect(page).to have_content(resource2.name)
    expect(page).to have_content(resource3.name)
  end
end
