# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all

10.times do
  Task.create(
    title: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    duration: Random.new.rand(100..10_000)
  )
end
