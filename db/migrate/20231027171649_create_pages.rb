class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages, id: :uuid do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
