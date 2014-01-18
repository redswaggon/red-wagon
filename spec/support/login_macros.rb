module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end

  def sign_in(user)
    visit root_url
    click_link "Sign in with Facebook"
  end
end