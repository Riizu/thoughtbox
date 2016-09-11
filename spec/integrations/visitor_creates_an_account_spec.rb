require 'rails_helper'

RSpec.feature 'A visitor can create an account' do
  context 'valid' do
    scenario 'they are at the create account page' do
      visit '/users/new'

      fill_in "Email", with: "email@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"

      click_on "Create Account"

      expect(current_path).to eq '/'
      expect(page).to have_content "Welcome email@example.com"
      expect(User.count).to eq 1
    end
  end

  context 'invalid' do
    scenario 'they are at the create account page and input an incorrect password' do
      visit '/users/new'

      fill_in "Email", with: "email@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "invalidpassword"

      click_on "Create Account"

      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    scenario 'they are at the create account page and input a previously used email' do
      existing_user = create(:user, email: "email@example.com")
      visit '/users/new'

      fill_in "Email", with: existing_user.email
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"

      click_on "Create Account"

      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Email has already been taken"
    end
  end
end