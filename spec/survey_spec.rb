require "spec_helper"

describe 'Survey' do
  describe '#contents' do
    it('tells which contents are assigned to the survey') do
      test_survey = Survey.create(title: "colors survey")
      test_content = Content.create(question: "What is your favorite color?", survey_id: test_survey.id)
      expect(test_survey.contents).to eq([test_content])
    end
  end
end
