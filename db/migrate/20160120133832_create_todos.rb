class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :ingaveDatum
      t.string :eindDatum
      t.integer :prioriteit
      t.text :beschrijving
      t.string :status

      t.timestamps
    end
  end
end
