require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "./lib/survey"
require "./lib/question"
require "./lib/result"
require "pry"

also_reload "lib/**/*.rb"

get "/" do
  erb :index
end
