class CreateDwBestPratices < ActiveRecord::Migration[5.2]
  def change
    create_table :dw_best_pratices do |t|
      t.boolean :metadata
      t.boolean :version
      t.boolean :license
      t.references :page, foreign_key: true
      t.references :open_gov_principle, foreign_key: true

      t.timestamps
    end
  end
end
