class AlbumController < ApplicationController

  def new_album
    @album = Album.new
    render :layout => "admin"
  end

  def create_album
   params[:album].each do |al|
    @album = Album.create(:title => al)
    @album.save
   end
   redirect_to (new_album_path)
  end

  def album_list
    @album_list = Album.all
    render :layout => "admin"
  end

  def edit_album
    @edit_album = Album.find_by_id(params[:id])
    render :layout => "admin"
  end

  def album_edit
    @edit_album = Album.find_by_id(params[:id])
    @edit_album.update_attributes(params[:album])
    redirect_to (album_list_path)
  end
  
  def destroy_album
    @delete_album = Album.find_by_id(params[:id])
    @delete_album.destroy
    redirect_to (album_list_path)
  end

  def logout
    
  end

end
