# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "#{Faker::Lorem.word}-#{n}" }
    description { Faker::Lorem.paragraph }
  end
end
