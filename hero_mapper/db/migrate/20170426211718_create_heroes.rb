class CreateHeroes < ActiveRecord::Migration[5.0]
  def change
    create_table :heroes do |t|
      t.string :name, null: false
      t.integer :comics,

      t.timestamps
    end
  end
end
