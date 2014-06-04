class ArtistController < ApplicationController
  def new_artist
    @artist = Artist.new
    render :layout => "admin"
  end

  def create_artist
   params[:artist].each do |ar|
    @artist = Artist.create(:name => ar)
    @artist.save
   end
    redirect_to (new_artist_path)
  end

  def artist_list
    @artist_list = Artist.all
    render :layout => "admin"
  end

  def edit_artist
    @edit_artist = Artist.find_by_id(params[:id])
    render :layout => "admin"
  end

  def artist_edit
    @edit_artist = Artist.find_by_id(params[:id])
    @edit_artist.update_attributes(params[:artist])
    redirect_to (artist_list_path)
  end

  def destroy_artist
    @delete_album = Artist.find_by_id(params[:id])
    @delete_album.destroy
    redirect_to (artist_list_path)
  end
  
end
