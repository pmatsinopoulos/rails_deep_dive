require 'spec_helper'

feature 'Sign In', %q{
  As an administrator
  I want to sign in to Loccasions
} do
  background do
    visit "/"
  end

  scenario "Click Sign In" do
    click_link "Sign In"
    page.should have_selector "title", :text => "Loccasions: Sign In"
    page.should have_selector "form"
  end

  scenario 'Successful Sign In' do
    click_sign_in
    FactoryGirl.create(:user)
    fill_in 'Email', :with => 'testy@test.com'
    fill_in 'Password', :with => 'password'
    click_on 'Sign in'
    current_path.should == user_root_path
    page.should have_selector "a", :text => "My Events", :href => events_path
  end

  scenario 'Unsuccessful Sign In' do
    click_sign_in
    fill_in 'Email', :with => 'hacker@getyou.com'
    fill_in 'Password', :with => 'badpassword'
    click_on 'Sign in'
    current_path.should == user_session_path
    page.should have_content 'Invalid email or password'
  end
end