class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :band, null: false
      t.boolean :studio, default: true

      t.timestamps
    end
    add_index :albums, :band
    add_index :albums, :title
  end
end
