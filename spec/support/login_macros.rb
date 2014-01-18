module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end

  def sign_in_new_user
    create(:neighborhood)
    visit root_url
    click_link "Sign in with Facebook"
    fill_in "Username", with: "Boberty"
    fill_in "Email", with: "bob@example.com"
    click_button "Submit Changes"
  end
end