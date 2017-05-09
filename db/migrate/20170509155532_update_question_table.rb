class UpdateQuestionTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:questions)
    create_table(:content) do |t|
      t.column(:question, :string)
      t.column(:answer, :string)
      t.column(:survey_id, :integer)
    end
  end
end
