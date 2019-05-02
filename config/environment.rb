require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3"
    :db => "db/development.sqlite"
)

require_all 'app'