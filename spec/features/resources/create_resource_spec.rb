require 'rails_helper'

RSpec.feature 'Creating a new resource', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario 'succeds with valid values' do
    visit '/resources'
    click_link 'New Resource'

    expect(current_url).to eq(new_resource_url)

    fill_in 'resource_name', with: 'Test Resource'
    fill_in 'resource_description', with: 'Test Resource Description'
    click_button 'Create Resource'

    expect(current_path).to eq(resource_path(Resource.last))
    expect(page).to have_content('Test Resource')
    expect(page).to have_content('Resource successfully created.')
  end

  scenario 'fails if the name is not provided' do
    visit '/resources'
    click_link 'New Resource'

    expect(current_path).to eq(new_resource_path)

    fill_in 'resource_name', with: ''
    fill_in 'resource_description', with: 'Test Resource Description'
    click_button 'Create Resource'

    expect(current_path).to eq(resources_path)
    expect(page).to have_content('error')
  end
end
