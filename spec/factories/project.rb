# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "#{Faker::Lorem.word}-#{n}" }
    description { Faker::Lorem.paragraph }

    after(:create) do |project|
      create_list(:task, 3, project: project)
    end
  end
end
