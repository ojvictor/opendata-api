class AddPageReferenceToOpenGovPrinciples < ActiveRecord::Migration[5.2]
  def change
    add_reference :open_gov_principles, :page, foreign_key: true
  end
end
