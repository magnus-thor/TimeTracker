# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "#{Faker::Lorem.word}-#{n}" }
    description { Faker::Lorem.paragraph }
  end
end
