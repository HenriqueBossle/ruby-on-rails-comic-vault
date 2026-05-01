class CreateComics < ActiveRecord::Migration[8.1]
  def change
    create_table :comics do |t|
      t.string :name
      t.integer :issue
      t.string :publishData
      t.integer :pageNumber
      t.string :imageUrl
      t.references :franchise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
