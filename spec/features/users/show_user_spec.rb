require 'rails_helper'

RSpec.feature 'Viewing a user', type: :feature do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'shows the fields' do

    visit user_url(@user)
    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.last_name)
    expect(page).to have_content(@user.email)
    expect(page).to have_content(@user.role)
    expect(page).to have_content(@user.status)
  end

  context 'shows with related data' do
    scenario 'shows tasks' do
      @project = FactoryGirl.create(:project)
      task1 = @project.tasks.create(name: 'Task one', user_id: @user.id, due_date: '1/1/2016')
      task2 = @project.tasks.create(name: 'Task two', user_id: @user.id, due_date: '1/1/2016')
      task3 = @project.tasks.create(name: 'Task three', user_id: @user.id, due_date: '1/1/2016')

      visit user_url(@user)

      visit project_url(@project)

      expect(page).to have_content(task1.name)
      expect(page).to have_content(task2.name)
      expect(page).to have_content(task3.name)
    end
  end
end
