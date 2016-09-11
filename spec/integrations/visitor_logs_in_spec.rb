require 'rails_helper'

RSpec.feature 'A visitor can log in' do
  context 'valid' do
    scenario 'they are at the sign in page' do
      user = create(:user)

      visit '/login'

      expect(current_path).to eq '/login'

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_on "Log In"

      expect(current_path).to eq '/'
      expect(page).to have_content "Welcome #{user.email}"
    end
  end

  context 'invalid' do
    scenario 'they are at the sign in page and input an incorrect password' do
      user = create(:user)

      visit '/login'

      expect(current_path).to eq '/login'

      fill_in "Email", with: user.email
      fill_in "Password", with: "invalidpassword"

      click_on "Log In"

      expect(current_path).to eq '/login'
      expect(page).to have_content "Please enter a valid username and password"
    end
  end
end