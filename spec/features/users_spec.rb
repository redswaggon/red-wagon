require 'spec_helper'

feature 'User Log in and Editing' do
  background do
    create(:neighborhood)
  end

  scenario "logs in from main page" do
    visit root_path
    expect(page).to have_content "Howdy!"
    expect(page).not_to have_content "My Wagon"
    expect(page).to have_content "Sign in with Facebook"

    click_link "Sign in with Facebook"

    expect(page).to have_content "Edit"

    fill_in "Username", with: "Boberty"
    fill_in "Email", with: "bob@example.com"

    click_button "Submit Changes"

    expect(page).to have_content "Boberty's Wagon"
  end
end