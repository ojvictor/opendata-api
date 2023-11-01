class ChangeForeignKeyInOpenGovPrinciples < ActiveRecord::Migration[5.2]
  def change
    remove_reference :open_gov_principles, :site, foreign_key: true, type: :uuid
    add_reference :open_gov_principles, :page, foreign_key: true, type: :uuid
  end
end
