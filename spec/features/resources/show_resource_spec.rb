require 'rails_helper'

RSpec.feature 'Viewing a resource', type: :feature do

  before(:each) do
    @resource = FactoryGirl.create(:resource)
  end

  scenario 'shows the fields' do

    visit resource_url(@resource)
    expect(page).to have_content(@resource.name)
    expect(page).to have_content(@resource.description)
  end

  context 'shows with related data' do
    scenario 'shows the enablements' do
      project1 = FactoryGirl.create(:project)
      project2 = FactoryGirl.create(:project)
      project3 = FactoryGirl.create(:project)

      enablement1 = Enablement.create(resource: @resource, project: project1)
      enablement2 = Enablement.create(resource: @resource, project: project2)
      enablement3 = Enablement.create(resource: @resource, project: project3)

      visit resource_url(@resource)

      expect(page).to have_content(project1.name)
      expect(page).to have_content(project2.name)
      expect(page).to have_content(project3.name)
    end
  end
end
