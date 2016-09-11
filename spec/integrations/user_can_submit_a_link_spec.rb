require 'rails_helper'

RSpec.feature "A user can submit a new link to their collection" do
  context "valid" do
    scenario "They submit a link via the new link form" do
      user = create(:user)
      login_user(user)

      within ".new-thought-form" do
        fill_in "Title", with: "A place where you can search for anything!"
        fill_in "URL", with: "http://google.com"
        click_on "Submit Thought"
      end

      expect(current_path).to eq root_path
      expect(Link.count).to eq 1

      created_link = Link.first

      expect(created_link.title).to eq "A place where you can search for anything!"
      expect(created_link.url).to eq "http://google.com"
      expect(created_link.user).to eq user

      within "#link-#{created_link.id}" do
        expect(page).to have_content "A place where you can search for anything!"
        expect(page).to have_link "http://google.com"
      end
    end
  end

  context "invalid" do
    scenario "They submit an invalid link via the new link form" do
      user = create(:user)
      login_user(user)

      within ".new-thought-form" do
        fill_in "Title", with: "A place where you can search for anything!"
        fill_in "URL", with: "sdgsg"
        click_on "Submit Thought"
      end

      expect(current_path).to eq root_path
      expect(Link.count).to eq 0
      expect(page).to have_content "Url is not a valid URL"
    end
  end
end