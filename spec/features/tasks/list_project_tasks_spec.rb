require 'rails_helper'

RSpec.feature 'Listing all tasks for project' do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  before(:each) do
    @project = FactoryGirl.create(:project)
  end

  scenario 'returns a message when there are no tasks to view' do
    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link @project.name
    expect(page.current_url).to eq(project_url(@project))

    expect(page).to have_content('0 assigned tasks')
  end

  scenario 'returns a message when there are multiple tasks to view' do

    task1 = @project.tasks.create(name: 'Task 1', due_date: '1/1/2016')
    task2 = @project.tasks.create(name: 'Task 2', due_date: '1/1/2016')
    task3 = @project.tasks.create(name: 'Task 3', due_date: '1/1/2016')

    visit '/'
    click_link 'Projects'

    expect(page.current_url).to eq(projects_url)
    click_link @project.name
    expect(page.current_url).to eq(project_url(@project))

    expect(page).to have_content('3 assigned tasks')
    expect(page).to have_content(task3.name)
    expect(page).to have_content(task2.name)
    expect(page).to have_content(task1.name)

  end
end
