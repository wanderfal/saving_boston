class AddMarvelIdToHeroes < ActiveRecord::Migration[5.0]
  def change
    add_column :heroes, :marvel_id, :integer
  end
end
