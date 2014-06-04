class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist
      t.references :album
      t.timestamps
    end
    
    add_index :songs, :artist_id
    add_index :songs, :album_id
  end
end
