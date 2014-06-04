class AdminController < ApplicationController

  def new
    @admin_create = Admin.new
    render :layout => "admin"
  end

  def admin_create
    @admin_create = Admin.create(params[:admin])
    puts""
    if @admin_create
      redirect_to (dashboard_path), :notice => "Logged in!"
    else
    render "new"
    end
  end

  def login_admin
    @admin = Admin.authenticate(params[:email], params[:password])
    if @admin
      session[:admin_id] = @admin.id
      current_admin = session[:admin_id]
      redirect_to (dashboard_path), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def login

  end

  def dashboard
    render :layout => "admin"
  end
  
  def add_song
    @songs = Song.new
    @artist = Artist.all
    @album = Album.all
    @music = Music.all
  end

  def create
    @songs = Song.create(params[:song])
    if @songs.save

       params[:music].each do |song|
        @musics = Entertainment.create(:music => song)
        @musics.song_id = @songs.id
        @musics.save
       end
    redirect_to (add_song_path)
    end
  end

  def logout
    session[:admin_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end