
# This class represents a Karaoke Song.
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
  has_many :genre_assignments
  has_many :genres, :through => :genre_assignments

  validates :title, :presence => true



  # Given a set of search terms, lookup for any associated song records.
  # Each term will be queried against song's title, artist's name, and album's title.
  # The set of song records associated with each term will be intersected to produce the final result.
  def self.search(terms)

    songs_for_term = [] # Set of songs associated with each term.
    terms.each_index do |index|
      songs_for_term[index] = Song.order("songs.id desc").
          includes(:artist).includes(:album).
          joins("LEFT JOIN artists ON songs.artist_id = artists.id").
          joins("LEFT JOIN albums ON songs.album_id = albums.id").
          where("LOWER(songs.title) LIKE :term OR LOWER(artists.name) LIKE :term OR LOWER(albums.title) LIKE :term", 
              :term => "%#{terms[index].downcase}%")
    end
    
    # Intersect the set of songs against each other.
    songs = songs_for_term[0] || []
    songs_for_term.each_index do |index|
      next if index == 0
      songs = songs & songs_for_term[index] # Intersection.
    end 
    
    return songs
  end
    
  # Return the song's file URL.
  def file_url
    sprintf("%s/%05d.mp3", Singchana::Application.config.song_file_path, self.id)
  end
  
  # Return the song's transcript as a string (XML format).
  def transcript
    file_name = sprintf("%s/%05d.xml", Singchana::Application.config.transcript_file_path, self.id)
    IO.read(file_name) # Return file's content.
  end
end
