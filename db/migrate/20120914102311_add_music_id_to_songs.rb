class AddMusicIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :music_id, :integer
  end
end
