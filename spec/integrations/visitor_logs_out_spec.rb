require 'rails_helper'

RSpec.feature 'A visitor can log out' do
  context 'valid' do
    scenario 'they are at the login page' do
      user = create(:user)

      visit '/login'
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Log In"

      expect(current_path).to eq "/"

      click_on "Sign Out"

      expect(current_path).to eq '/login'
      expect(page).to have_content "Successfully logged out."
    end
  end
end