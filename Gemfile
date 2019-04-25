# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "rails", "~> 5.2.3"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "pry-rails", "~> 0.3.6"
  gem "factory_bot_rails", "~> 4.8", ">= 4.8.2"
  gem "faker", "~> 1.8", ">= 1.8.7"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rspec-rails"
  gem "shoulda-matchers", "~> 3.1", ">= 3.1.2"
  gem "database_cleaner", "~> 1.6", ">= 1.6.2"
end
