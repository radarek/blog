def signin_admin(login, password)
  visit "/login"
  fill_in "Login", with: login
  fill_in "Password", with: password

  click_button "Sign in"
end
