require 'rails_helper'

RSpec.feature 'Creating a new booking', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
    @project = FactoryGirl.create(:project)
    @resource = FactoryGirl.create(:resource)
  end

  scenario 'succeds with valid values' do
    visit new_booking_path

    select @project.name, from: 'booking_project_id'
    select @resource.name, from: 'booking_resource_id'
    fill_in 'booking_start_datetime', with: '2015/1/1'
    fill_in 'booking_end_datetime', with: '2015/12/31'
    click_button 'Create Booking'

    expect(current_path).to eq(booking_path(Booking.last))
    expect(page).to have_content(Booking.last.project.name)
    expect(page).to have_content(Booking.last.resource.name)
  end
end
