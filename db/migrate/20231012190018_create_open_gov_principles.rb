class CreateOpenGovPrinciples < ActiveRecord::Migration[5.2]
  def change
    create_table :open_gov_principles do |t|
      t.boolean :complete
      t.boolean :primary
      t.boolean :accessible

      t.timestamps
    end
  end
end
