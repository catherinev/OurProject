require "factory_girl_rails"

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "numero#{n}@robots.com"}
    password 'f4k3p455w0rd'
  end
end

FactoryGirl.define do
  factory :category do
    title 'API'
  end
end
