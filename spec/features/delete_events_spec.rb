require 'spec_helper'

feature 'Delete Event', %q{
  As a registered user,
  I want to delete an event
} do
  background do
    @user = FactoryGirl.create(:user)
    @event = FactoryGirl.create(:event, :user => @user, :name => "Dead Event Walking")
    login_user @user
  end

  scenario "Delete Event" do
    page.should have_content "Dead Event Walking"
    page.should have_selector "form[action='/events/#{@event.id}'] input[value='delete']"
    click_button "X"
    page.should_not have_content "Dead Event Walking"
  end
end