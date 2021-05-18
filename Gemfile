source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'carrierwave'
gem 'cocoon'
gem 'devise'
gem 'haml-rails', '~> 2.0'
gem 'jbuilder', '~> 2.7'
gem 'migration_data'
gem 'mini_magick'
gem 'pg'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3'
gem 'webpacker', '~> 4.0'
gem 'will_paginate'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara'
  gem 'webdrivers', '~> 4.0'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.0.0.beta3'
  gem 'selenium-webdriver'
  gem 'win32console', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end

group :production do
  gem 'fog-aws'
  gem 'rack-cors'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
