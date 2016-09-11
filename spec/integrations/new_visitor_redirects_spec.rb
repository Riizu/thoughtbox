require 'rails_helper'

RSpec.feature 'A new visitor is redirected appropriately' do
    context 'new user' do
        scenario 'they visit the root URL as a new user' do
            visit '/'

            expect(current_path).to eq '/login'

            expect(page).to have_content "Please sign in"
            
            expect(page).to have_field "Email"
            expect(page).to have_field "Password"

            expect(page).to have_button "Login"
            expect(page).to have_button "Sign Up"
        end

        scenario 'clicking sign up redirects to users/new' do
            visit '/'

            expect(current_path).to eq '/login'

            click_on "Sign Up"

            expect(current_path).to eq '/users/new'
        end
    end
end