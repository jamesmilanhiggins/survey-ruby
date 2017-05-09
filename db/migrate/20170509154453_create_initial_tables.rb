class CreateInitialTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |t|
      t.column(:title, :string)
    end
    create_table(:questions) do |t|
      t.column(:content, :string)
      t.column(:survey_id, :integer)
    end
  end
end
