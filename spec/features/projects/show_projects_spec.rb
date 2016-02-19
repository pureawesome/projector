require 'rails_helper'

RSpec.feature 'Viewing a project', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  before(:each) do
    @project = FactoryGirl.create(:project)
  end

  scenario 'shows the fields' do

    visit project_url(@project)
    expect(page).to have_content(@project.name)
    expect(page).to have_content(@project.description)
    expect(page).to have_content(@project.start_date)
    expect(page).to have_content(@project.end_date_actual)
    expect(page).to have_content(@project.end_date_projected)
    expect(page).to have_content(@project.budget)
    expect(page).to have_content(@project.cost)
  end

  context 'shows with related data' do
    scenario 'shows the project tasks' do

      task1 = @project.tasks.create(name: 'Task one', due_date: '1/1/2016')
      task2 = @project.tasks.create(name: 'Task two', due_date: '1/1/2016')
      task3 = @project.tasks.create(name: 'Task three', due_date: '1/1/2016')

      visit project_url(@project)

      expect(page).to have_content('Task one')
      expect(page).to have_content('Task two')
      expect(page).to have_content('Task three')
    end

    scenario 'shows the project enablements' do
      resource1 = FactoryGirl.create(:resource)
      resource2 = FactoryGirl.create(:resource)
      resource3 = FactoryGirl.create(:resource)

      enablement1 = Enablement.create(project: @project, resource: resource1)
      enablement2 = Enablement.create(project: @project, resource: resource2)
      enablement3 = Enablement.create(project: @project, resource: resource3)

      visit project_url(@project)

      expect(page).to have_content(resource1.name)
      expect(page).to have_content(resource2.name)
      expect(page).to have_content(resource3.name)
    end
  end
end
