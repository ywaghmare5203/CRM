
require 'search_string'

class SongsController < ApplicationController
  # Display main page.
  def index
    @songs = Song.includes(:artist).includes(:album).order('created_at DESC').all
  end

  # Filter the song list according to the given search string.
  def search
    if params[:query].blank?
      render_error('Search string not provided') and return
    end
    
    search_terms = SearchString.new(params[:query]).tokenize
    @songs = Song.search(search_terms)
    
    render 'search_result', locals: { songs: @songs }
  end
  
  # Display song list for a specific artist.
  def artist
    @songs = Song.find_all_by_artist_id(params[:id])
    render action: :index
  end
  
  # Display song list for a specific album.
  def album
    @songs = Song.find_all_by_album_id(params[:id])
    render action: :index
  end

  def create_music
    
  end
end
