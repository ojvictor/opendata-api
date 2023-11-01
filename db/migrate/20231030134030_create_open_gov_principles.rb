class CreateOpenGovPrinciples < ActiveRecord::Migration[5.2]
  def change
    create_table :open_gov_principles, id: :uuid do |t|
      t.boolean :completeness
      t.boolean :primacy
      t.boolean :timeliness
      t.boolean :easy_physical_or_electronic_access
      t.boolean :machine_readability
      t.boolean :non_discrimination
      t.boolean :commonly_owned_or_open_standards
      t.boolean :licensing
      t.boolean :permanence
      t.boolean :usage_costs
      t.references :site, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
