require 'spec_helper'

describe Song do

  describe "Validation" do
    it "pass validation with valid attributes" do
      build(:song).should be_valid
    end

    it "is invalid without title" do
      build(:song, title: nil).should_not be_valid
    end
  end
 
  it "#file_url return song file URL" do
    song = create(:song)
    song.file_url.should match /#{sprintf("%05d", song.id)}/i
  end
  
  it "#transcript return song transcript string" do
    xml_string = '<xml>'
    IO.stub(:read).and_return(xml_string)

    create(:song).transcript.should == xml_string
  end
  
  describe "#search" do
    # Add dummy list of songs, albums, and artists before performing search.
    before(:each) { create_list :song, 10 }

    it "lookup for song's title" do
      song_title = 'song_title'
      create(:song, title: song_title)

      songs = Song.search [song_title]
      songs.size.should be > 0
      songs.each { |song| song.title.should match /.*#{song_title}.*/i }
    end
    
    it "lookup for artist's name" do
      artist_name = 'artist_name'
      artist = create(:artist, name: artist_name)
      create(:song, artist: artist)

      songs = Song.search [artist_name]
      songs.size.should be > 0
      songs.each { |song| song.artist.name.should match /.*#{artist_name}.*/i }
    end
    
    it "lookup for album's title" do
      album_title = 'album_title'
      album = create(:album, title: album_title)
      create(:song, album: album)

      songs = Song.search [album_title]
      songs.size.should be > 0
      songs.each { |song| song.album.title.should match /.*#{album_title}.*/i }
    end
  end
end
