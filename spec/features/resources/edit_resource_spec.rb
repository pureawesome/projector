require 'rails_helper'

RSpec.feature 'Editing a new resource', type: :feature do
  scenario 'updates correctly' do
    visit '/resources'
    click_link 'New Resource'

    expect(current_url).to eq(new_resource_url)
    fill_in 'resource_name', with: 'Test Resource'
    fill_in 'resource_description', with: 'Test Resource Description'
    click_button 'Create Resource'

    expect(current_path).to eq(resource_path(Resource.last))
    click_link 'Edit Resource'

    fill_in 'resource_name', with: 'Edited'
    click_button 'Update Resource'

    expect(current_path).to eq(resource_path(Resource.last))
    expect(page).to have_content('Resource successfully updated.')
    click_link 'Back to Resource'

    expect(page).to have_content('Edited')
  end
end
