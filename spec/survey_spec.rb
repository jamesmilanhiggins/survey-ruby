require "spec_helper"

describe 'Survey' do

  describe '#contents' do
    it('tells which contents are assigned to the survey') do
      test_survey = Survey.create(title: "colors survey")
      test_content = Content.create(question: "What is your favorite color?", survey_id: test_survey.id)
      test_content2 = Content.create(question: "What is least favorite color?", survey_id: test_survey.id)
      expect(test_survey.contents).to eq([test_content, test_content2])
    end
  end

  describe '#create' do
    it('tells which contents are assigned to the survey') do
      test_survey = Survey.create(title: "colors survey")
      expect(test_survey.title).to eq('Colors Survey')
    end
  end

end
