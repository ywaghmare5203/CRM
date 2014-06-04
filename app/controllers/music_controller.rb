class MusicController < ApplicationController
  def new_music
    @music = Music.new
    render :layout => "admin"
  end

  def create_music
   params[:music].each do |mu|
    @music = Music.create(:name => mu)
    @music.save
   end
    redirect_to (new_music_path)
  end

  def music_list
    @music_list = Music.all
    render :layout => "admin"
  end

  def edit_musics
    @edit_music = Music.find_by_id(params[:id])
    render :layout => "admin"
  end

  def edit
    @edit_music = Music.find_by_id(params[:id])
    @edit_music.update_attributes(params[:music])
    redirect_to (music_list_path)
  end

  def destroy_music
    @delete_music = Music.find_by_id(params[:id])
    @delete_music.destroy
    redirect_to (music_list_path)
  end
end
