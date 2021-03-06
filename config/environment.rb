ENV['SINATRA_ENV'] ||= "developement"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Dotenv.load if ENV['SINATRA_ENV'] == "development"

set :database_file, "./database.yml"
require './app/controllers/application_controller'
require './app/controllers/users_controller'
#require'./app/controllers/items_controller
require_all 'app'
