require "factory_girl_rails"

FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end
end

FactoryGirl.define do
  factory :category do
    title 'API'
  end
end

FactoryGirl.define do
  factory :question do
    title 'new question'
    content 'i have a great question'
    association :category, factory: :category
    association :user, factory: :user
  end
end

FactoryGirl.define do
  factory :answer do
    content 'i have the perfect solution'
    association :question, factory: :question
    association :user, factory: :user
  end
end