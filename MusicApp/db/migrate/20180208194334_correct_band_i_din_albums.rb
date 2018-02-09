class CorrectBandIDinAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :band
    add_column :albums, :band_id, :string, null: false
    add_index :albums, :band_id
  end
end
