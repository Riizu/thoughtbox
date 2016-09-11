require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }

  it "validates urls" do 
    link = Link.new(url: "http://www.testlink.com", title: "Test link")

    expect(link.valid?).to eq true
  end

  it "invalidates urls" do 
    link = Link.new(url: "httf://www.testlink.com", title: "Test link")

    expect(link.valid?).to eq false
  end

  it "has a default read value of false" do
    link = Link.new(url: "http://www.testlink.com", title: "Test link")

    expect(link.read).to eq false
  end
end
