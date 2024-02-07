class CreateDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :definitions, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :attribute

      t.timestamps
    end
  end
end
