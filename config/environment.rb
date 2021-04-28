require 'bundler'
Bundler.require

configure :development do
	set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}
end

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/database.sqlite3"
)

require_all 'app'