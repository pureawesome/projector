require 'rails_helper'

RSpec.feature 'Viewing a project', type: :feature do
  scenario 'shows the fields' do
    project = FactoryGirl.create(:project)

    visit project_url(project)
    expect(page).to have_content(project.name)
    expect(page).to have_content(project.description)
    expect(page).to have_content(project.start_date)
    expect(page).to have_content(project.end_date_actual)
    expect(page).to have_content(project.end_date_projected)
    expect(page).to have_content(project.budget)
    expect(page).to have_content(project.cost)
  end

  context 'shows with related data' do
    before(:all) do

    end

    scenario 'shows the project tasks' do
      @project1 = FactoryGirl.create(:project)
      task1 = @project1.tasks.build(name: 'Task one')
      task2 = @project1.tasks.build(name: 'Task two')
      task3 = @project1.tasks.build(name: 'Task three')

      visit project_url(@project1)

      expect(page).to have_content('Task one')
      expect(page).to have_content('Task two')
      expect(page).to have_content('Task three')
    end

    # scenario 'shows the project enablements' do
    #   resource1 = FactoryGirl.create(:resource)
    #   resource2 = FactoryGirl.create(:resource)
    #   resource3 = FactoryGirl.create(:resource)
    #
    #   enablement1 = Enablement.create(project: @project1, resource: resource1)
    #   enablement2 = Enablement.create(project: @project1, resource: resource2)
    #   enablement3 = Enablement.create(project: @project1, resource: resource3)
    #
    #   visit project_url(@project1)
    #
    #   expect(page).to have_content(resource1.name)
    #   expect(page).to have_content(resource2.name)
    #   expect(page).to have_content(resource3.name)
    # end
  end
end
