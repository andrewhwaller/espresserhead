# frozen_string_literal: true

source 'https://rubygems.org'
gem 'sinatra'

# ruby '~> 2.5.3'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', :require => 'active_record'
gem 'bcrypt'
gem 'pg'
gem 'pry'
gem 'puma'
gem 'rake'
gem 'require_all'
gem 'shotgun'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra-flash'
gem 'thin'
gem 'tux'

group :test do
  gem 'capybara'
  gem 'rack-test'
  gem 'rspec'
end

group :production do
  gem 'heroku-deflater'
end
