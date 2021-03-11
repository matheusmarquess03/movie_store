class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :release_year
      t.text :synopsis
      t.string :director
      t.integer :rating

      t.timestamps
    end
  end
end
