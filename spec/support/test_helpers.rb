module TestHelpers
  def login_user(user)
    visit '/login'
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log In"
  end
end