class CreateOpenGovPrinciples < ActiveRecord::Migration[5.2]
  def change
    create_table :open_gov_principles, id: :uuid do |t|
      t.boolean :complete
      t.boolean :primary
      t.boolean :accessible
      t.references :page, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
