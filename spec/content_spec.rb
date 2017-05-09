require 'spec_helper'

describe 'Content' do
  describe '#survey' do
    it('tells which survey the content is asscociated with') do
      test_survey = Survey.create(title: "colors survey")
      test_content = Content.create(question: "What is your favorite color?", survey_id: test_survey.id)
      expect(test_content.survey).to eq(test_survey)
    end
  end
end
