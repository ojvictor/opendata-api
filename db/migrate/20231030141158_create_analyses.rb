class CreateAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :analyses, id: :uuid do |t|
      t.boolean :maybe_false_positive
      t.date :analysis_date
      t.boolean :provide_api_reference
      t.references :page, foreign_key: true, type: :uuid
      t.references :dw_best_pratice, foreign_key: true, type: :uuid
      t.references :open_gov_principle, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
