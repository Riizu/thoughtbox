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

    scenario "They enter a search that matches everything" do
      user = create(:user)
      create_list(:link, 10, user: user)
      login_user(user)

      fill_in 'Search', with: "Test Link"

      expect(page).to have_selector(".link", visible: true, count: 10)
    end

    scenario "They enter a search that matches nothing" do
      user = create(:user)
      create_list(:link, 10, user: user)
      login_user(user)

      fill_in 'Search', with: "xxxxx"

      expect(page).to have_selector(".link", visible: false, count: 10)
    end

    scenario "They enter a search that matches one result" do
      user = create(:user)
      links = create_list(:link, 10, user: user)
      target_link = links.first

      login_user(user)

      fill_in 'Search', with: target_link.url

      expect(page).to have_selector(".link", visible: true, count: 1)
    end

    scenario "They filter alphabetically" do
      user = create(:user)
      link_1 = create(:link, title: "Alpha", user: user)
      link_2 = create(:link, title: "Echo", user: user)
      link_3 = create(:link, title: "Zulu", user: user)

      login_user(user)

      click_on 'Filter A-Z'

      links = page.all(".link .title")
      
      expect(links[0].text).to eq link_1.title
      expect(links[1].text).to eq link_2.title
      expect(links[2].text).to eq link_3.title
    end
  end
end