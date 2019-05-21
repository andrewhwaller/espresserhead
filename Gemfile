# frozen_string_literal: true
source 'https://rubygems.org'
ruby '2.5.3'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', :require => 'active_record'
gem 'bcrypt'
gem 'pg'
gem 'pry'
gem 'puma'
gem 'rake'
gem 'require_all'
gem 'shotgun'
gem 'sinatra'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'thin'
gem 'tux'

group :test do
  gem 'capybara'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  gem 'rack-test'
  gem 'rspec'
end
