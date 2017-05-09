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

get '/take-survey/:id' do
  survey_id = params['id']
  @survey = Survey.find(survey_id)
  erb :take_survey
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

post '/take-survey/:id/submit' do
  survey_id = params['id']
  @survey = Survey.find(survey_id)
  results = params['result']
  question_ids = params['question_id']
  values = []
  results.each do |result|
    result.store("survey_id", survey_id)
    values.push(result)
  end
  results.length.times do |i|
    values[i].store('question_id',question_ids[i]['question_id'])
  end
  Result.create(values)
  binding.pry
  redirect '/'
end

delete('/surveys/:id/delete') do
  id = params['id']
  Survey.destroy(id)
  redirect '/'
end

delete('/surveys/:id/delete-question') do
  id = params['id']
  question_id = params['question-id']
  Question.destroy(question_id)
  redirect "/surveys/#{id}"
end

post '/surveys/:id/add-question' do
  question = params['question']
  survey_id = params['id']
  new_question = Question.create(content: question, survey_id: survey_id)
  redirect "/surveys/#{survey_id}"
end
