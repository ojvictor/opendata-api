class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages, id: :uuid do |t|
      t.string :title
      t.string :url
      t.references :site, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
