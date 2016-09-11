require 'rails_helper'

describe "Links Endpoint" do
  it "should update the read status of a link" do
    link = create(:link)

    patch "/api/v1/links/#{link.id}?read=true"

    expect(response).to be_success

    parsed_link = JSON.parse(response.body)
    saved_link = Link.first

    expect(parsed_link["title"]).to eq link.title
    expect(parsed_link["url"]).to eq link.url
    expect(parsed_link["read"]).to eq true

    expect(saved_link.title).to eq link.title
    expect(saved_link.url).to eq link.url
    expect(saved_link.read).to eq true
  end

  it "should update the title of a link" do
    link = create(:link)

    patch "/api/v1/links/#{link.id}?title=fake title"

    expect(response).to be_success

    parsed_link = JSON.parse(response.body)
    saved_link = Link.first

    expect(parsed_link["title"]).to eq "fake title"
    expect(parsed_link["url"]).to eq link.url
    expect(parsed_link["read"]).to eq link.read

    expect(saved_link.title).to eq "fake title"
    expect(saved_link.url).to eq link.url
    expect(saved_link.read).to eq link.read
  end

  it "should update the url of a link" do
    link = create(:link)

    patch "/api/v1/links/#{link.id}?url=http://google.com"

    expect(response).to be_success

    parsed_link = JSON.parse(response.body)
    saved_link = Link.first

    expect(parsed_link["title"]).to eq link.title
    expect(parsed_link["url"]).to eq "http://google.com"
    expect(parsed_link["read"]).to eq link.read

    expect(saved_link.title).to eq link.title
    expect(saved_link.url).to eq "http://google.com"
    expect(saved_link.read).to eq link.read
  end
end