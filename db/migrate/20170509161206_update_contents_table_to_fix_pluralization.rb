class UpdateContentsTableToFixPluralization < ActiveRecord::Migration[5.1]
  def change
    drop_table(:content)
    create_table(:contents) do |t|
      t.column(:question, :string)
      t.column(:answer, :string)
      t.column(:survey_id, :integer)
    end
  end
end
