source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap', '~> 4.0.0.beta'
gem 'jquery-rails'
gem 'font-awesome-sass'
gem 'config'
gem 'devise'
gem 'friendly_id', '~> 5.1.0'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'fog'
gem 'fastimage'
gem 'jquery-ui-rails'
gem 'rails_sortable'
gem 'paranoia', '~> 2.2'
gem 'ckeditor'
gem 'will_paginate', '~> 3.1.0'
gem 'carrierwave_backgrounder', :git => 'https://github.com/lardawge/carrierwave_backgrounder.git'
gem 'sidekiq'
gem 'sinatra'
gem 'redis-namespace'
gem 'capistrano-sidekiq'
gem 'impressionist'
gem 'httparty'
gem 'rest-client'
gem 'prawn'
gem 'prawn-table'
gem 'whenever', :require => false
gem 'aasm'
gem 'ahoy_matey'
gem 'chartkick'

# gem for API development
gem 'active_model_serializers', github: 'rails-api/active_model_serializers', branch: '0-10-stable'
gem 'rack-cors', :require => 'rack/cors'
gem 'rack-attack'
gem 'redis-activesupport'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  gem 'capistrano', '~> 3.9'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-faster-assets', '~> 1.0'
end

group :test do
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
