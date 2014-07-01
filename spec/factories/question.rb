require "factory_girl_rails"


FactoryGirl.define do
  factory :question do
    title 'new question'
    content 'i have a great question'
    association :category, factory: :category
    association :user, factory: :user
  end
end