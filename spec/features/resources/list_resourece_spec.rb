require 'rails_helper'

RSpec.feature 'Listing all resources', type: :feature do
  scenario 'returns a message when there are no resources' do
    visit '/'
    click_link 'Resources'

    expect(current_url).to eq(resources_url)
    expect(page).to have_content('0 resources')
  end

  scenario 'it displays the resources' do
    resource1 = Resource.create!(name: 'Resource 1', description: 'The new resource one')
    resource2 = Resource.create!(name: 'Resource 2', description: 'The new resource two')
    resource3 = Resource.create!(name: 'Resource 3', description: 'The new resource three')

    visit '/'
    click_link 'Resources'

    expect(current_url).to eq(resources_url)
    expect(page).to have_content('3 resources')
    expect(page).to have_content(resource1.name)
    expect(page).to have_content(resource2.name)
    expect(page).to have_content(resource3.name)
  end
end
