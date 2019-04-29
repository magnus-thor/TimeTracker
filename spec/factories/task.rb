# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "#{Faker::Lorem.word}-#{n}" }
    description { Faker::Lorem.paragraph }
    duration { Random.new.rand(100..10_000) }
  end
end
