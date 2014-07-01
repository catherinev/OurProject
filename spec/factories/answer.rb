require "factory_girl_rails"


FactoryGirl.define do
  factory :answer do
    content 'i have the perfect solution'
    association :question, factory: :question
    association :user, factory: :user
  end
end