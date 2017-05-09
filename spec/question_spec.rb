require 'spec_helper'

describe 'Question' do
  describe '#survey' do
    it('tells which survey the question is asscociated with') do
      test_survey = Survey.create(title: "colors survey")
      test_question = Question.create(content: "What is your favorite color?", survey_id: test_survey.id)
      expect(test_question.survey).to eq(test_survey)
    end
  end
end
