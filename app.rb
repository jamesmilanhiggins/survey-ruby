require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "./lib/survey"
require "./lib/content"
require "pry"

also_reload "lib/**/*.rb"

get "/" do
  erb :index
end
