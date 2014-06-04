
# This class provides interfaces for the Karaoke Flash app to communicate with.
class KaraokeController < ApplicationController

  respond_to :xml, :except => :index
  before_filter :require_login
  before_filter :require_karaoke_session, :except => :index

  # Display the Karaoke Flash app and initiate Karaoke session.
  def index
    @song = Song.find(params[:id])
    
    # Initiate Karaoke session. Set some session variables.
    session[:karaoke_id] = KaraokeSession.start(@user.id, @song.id)
  end
  
  # Download song transcript for current Karaoke session.
  def song_transcript
    song = Song.find(@karaoke.song_id)
    render :xml => song.transcript
  end
  
  # Receive score submission and end Karaoke session.
  def submit_score
    # Log score and finalize session.
    @karaoke.score = params[:score]
    @karaoke.finalize!
    session[:karaoke_id] = nil
    
    # Assign appropriate sing_count badges
    badges = Badge.find_all_by_category('sing_count')
    sing_count = @user.sing_count
    badges.each do |badge|
      if sing_count <= badge.required_value 
        Achievement.grant(@user.id, badge.id)
      end
    end
    
    # Everything is OK, nothing to report.
    render :nothing => true
  end
  
protected

  # Return error message if there is no Karaoke session.
  def require_karaoke_session(load_karaoke = true)
    raise "Karaoke session is not initiated" if session[:karaoke_id].nil?
    @karaoke = KaraokeSession.find(session[:karaoke_id]) if load_karaoke
  end
end
