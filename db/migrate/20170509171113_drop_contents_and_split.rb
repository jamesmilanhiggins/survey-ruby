class DropContentsAndSplit < ActiveRecord::Migration[5.1]
  def change

    drop_table(:contents)
    create_table(:questions) do |t|
      t.column(:content, :string)
      t.column(:survey_id, :integer)
    end

    create_table(:results) do |t|
      t.column(:answer, :string)
      t.column(:survey_id, :integer)
      t.column(:question_id, :integer)
    end

  end
end
