require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }

  it "validates urls" do 
    user = create(:user)
    link = Link.new(url: "http://www.google.com", title: "Test link", user: user)

    expect(link.valid?).to eq true
  end

  it "invalidates urls" do 
    user = create(:user)
    link = Link.new(url: "httf://www.testlink.com", title: "Test link", user: user)

    expect(link.valid?).to eq false
  end

  it "has a default read value of false" do
    user = create(:user)
    link = Link.new(url: "http://www.testlink.com", title: "Test link", user: user)

    expect(link.read).to eq false
  end
end
