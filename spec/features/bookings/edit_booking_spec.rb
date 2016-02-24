require 'rails_helper'

RSpec.feature 'Edit a new booking', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
    @project = FactoryGirl.create(:project)
    @resource = FactoryGirl.create(:resource)
  end

  scenario 'succeds with valid values' do
    @booking = Booking.create!(
      project_id: @project.id,
      resource_id: @resource.id,
      start_datetime: '2015/1/1',
      end_datetime: '2015/12/31')

    visit edit_booking_path(@booking)
    expect(page).to have_content(@booking.project.name)
    expect(page).to have_content(@booking.resource.name)
    fill_in 'booking_start_datetime', with: '2015/2/1'
    click_button 'Update Booking'

    expect(current_path).to eq(booking_path(@booking))
    expect(page).to have_content('2/1/15')
  end
end
