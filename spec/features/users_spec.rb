require 'spec_helper'

feature 'User Profile Management' do
  scenario "logs in from main page and edits profile" do
    visit root_path
    expect(page).to have_content "Howdy!"
    expect(page).not_to have_content "My Wagon"
    expect(page).to have_content "Sign in with Facebook"

    sign_in_new_user
    expect(page).to have_content "Boberty's Wagon"
  end

  scenario "delete account"
end

feature "Wagon Image Management" do
  # Image specs here because they're on users#show
  # Item management happens on IFrames
  background do
    sign_in_new_user
  end

  scenario "Adds an image"#, js: true do
  scenario "Deletes an image"#, js: true do
end