class CreateDwBestPratices < ActiveRecord::Migration[5.2]
  def change
    create_table :dw_best_pratices, id: :uuid do |t|
      t.boolean :metadata
      t.boolean :version
     t.boolean :license
      t.references :page, foreign_key: true, type: :uuid
      t.references :open_gov_principle, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
