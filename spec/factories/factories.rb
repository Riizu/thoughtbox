FactoryGirl.define do
  factory :user do
    email
    password "password"
    password_confirmation "password"
  end

  factory :link do
    url
    title "Test Link"
    user
  end

  sequence :url do |n|
  "http://www.testlink#{n}.com"
  end

  sequence :email do |n|
    "email#{n}@example.com"
  end
end