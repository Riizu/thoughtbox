require 'rails_helper'

RSpec.feature "A user can filter the links in their collection", js: true do
  context "valid" do
    scenario "They click the show-read button" do
      user = create(:user)
      create_list(:link, 10, user: user)
      unread_link = user.links.last
      read_link = user.links.first
      read_link.update_attributes(read: true)
      login_user(user)

      click_on 'filter-read'

      expect(page).to have_selector("#link-#{read_link.id}", visible: false)
      expect(page).to have_selector("#link-#{unread_link.id}", visible: true) 
    end

    scenario "They click the show-unread button" do
      user = create(:user)
      create_list(:link, 10, user: user)
      unread_link = user.links.last
      read_link = user.links.first
      read_link.update_attributes(read: true)
      login_user(user)

      click_on 'filter-unread'

      expect(page).to have_selector("#link-#{read_link.id}", visible: true)
      expect(page).to have_selector("#link-#{unread_link.id}", visible: false) 
    end
  end
end