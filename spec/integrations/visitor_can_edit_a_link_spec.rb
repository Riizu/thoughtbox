require 'rails_helper'

RSpec.feature "A user can edit their links" do
  context "valid" do
    scenario "They visit the home page and edit one of their links" do
      user = create(:user)
      link = create(:link, user: user)
      login_user(user)

      within "#link-#{link.id}" do
        click_on "Edit"
      end

      expect(current_path).to eq edit_link_path(link.id)

      save_and_open_page

      fill_in "link_title", with: "Some other link"
      fill_in "link_url", with: "http://google.com"
      click_on "Update Thought"

      expect(current_path).to eq root_path

      within "#link-#{link.id}" do
        expect(page).to have_content "Some other link"
        expect(page).to have_content "http://google.com"
      end
    end
  end

  context "invalid" do
    scenario "They attempt to access the edit page for a link that isn't theirs'" do
      user = create(:user)
      unowned_link = create(:link)
      login_user(user)

      visit edit_link_path(unowned_link)

      expect(current_path).to eq root_path
      expect(page).to have_content "You do not have permission to access that page"
    end
  end
end