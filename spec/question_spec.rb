require 'spec_helper'

describe 'Question' do

  describe '#survey' do
    it('tells which survey the question is asscociated with') do
      test_survey = Survey.create(title: "colors survey")
      test_question = Question.create(content: "What is your favorite color?", survey_id: test_survey.id)
      expect(test_question.survey).to eq(test_survey)
    end
  end

  describe '#results' do
    it('tells which results are asscociated with the question') do
      test_survey = Survey.create(title: "colors survey")
      test_question = Question.create(content: "What is your favorite color?", survey_id: test_survey.id)
      test_result = Result.create(answer: "red", survey_id: test_survey.id, question_id: test_question.id)
      test_result2 = Result.create(answer: "grey", survey_id: test_survey.id, question_id: test_question.id)
      expect(test_question.results).to eq([test_result, test_result2])
    end
  end

end
