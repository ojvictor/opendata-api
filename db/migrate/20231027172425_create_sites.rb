class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites, id: :uuid do |t|
      t.string :domain

      t.timestamps
    end
  end
end
