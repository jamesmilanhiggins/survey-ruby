require "spec_helper"

describe 'Survey' do
  it('validates presence of description') do
    test_survey = Survey.create(title: "")
    expect(test_survey.save).to(eq(false))
  end

  describe '#questions' do
    it('tells which questions are assigned to the survey') do
      test_survey = Survey.create(title: "colors survey")
      test_question = Question.create(content: "What is your favorite color?", survey_id: test_survey.id)
      test_question2 = Question.create(content: "What is least favorite color?", survey_id: test_survey.id)
      expect(test_survey.questions).to eq([test_question, test_question2])
    end
  end

  describe '#results' do
    it('tells which results are assigned to the question and survey') do
      test_survey = Survey.create(title: "colors survey")
      test_question = Question.create(content: "What is your favorite color?", survey_id: test_survey.id)
      test_result = Result.create(answer: "red", survey_id: test_survey.id, question_id: test_question.id)
      test_result2 = Result.create(answer: "grey", survey_id: test_survey.id, question_id: test_question.id)
      expect(test_survey.results).to eq([test_result, test_result2])
    end
  end

  describe '#create' do
    it('tells which contents are assigned to the survey') do
      test_survey = Survey.create(title: "colors survey")
      expect(test_survey.title).to eq('Colors Survey')
    end
  end



end
