require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "./lib/survey"
require "./lib/question"
require "./lib/result"
require "pry"
enable :sessions

also_reload "lib/**/*.rb"

get '/' do
  @all_surveys = Survey.all
  erb :index
end

get '/surveys/new' do
  erb :new_survey
end

post '/surveys/new' do
  survey_title = params['survey-title']
  new_survey = Survey.create(title: survey_title)
  redirect "/surveys/#{new_survey.id}"
end

get '/surveys/:id' do
  survey_id = params['id']
  @survey = Survey.find(survey_id)
  erb :survey
end

post '/surveys/:id/submit' do
  # survey_id = params['id']
  # @survey = Survey.find(survey_id)
  # results = params['result']
  # question_ids = params['question_id']
  # test = []
  # results.each do |result|
  #   result.store("survey_id", survey_id)
  #   test.push(result)
  # end
  # question_ids.each do |hash|
  #   hash.each do |k,v|
  #     test.each do |hash|
  #       hash.store("question_id", v)
  #     end
  #   end
  # end
  # new_result = Result.create(results)
  erb :survey
end

post '/surveys/:id/add-question' do
  question = params['question']
  survey_id = params['id']
  new_question = Question.create(content: question, survey_id: survey_id)
  redirect "/surveys/#{survey_id}"
end
