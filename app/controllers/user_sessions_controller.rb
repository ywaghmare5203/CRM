class UserSessionsController < ApplicationController
  respond_to :js, :only => [:create]

  def new
    session[:form_referrer] = request.referrer
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      flash[:notice] = "User logged in (#{current_user.email})" 
      @redirect_url = session[:form_referrer] || root_url
    end
      
    respond_with @user_session
  end
  
  def destroy
    current_user_session.destroy if current_user_session
    redirect_to root_url, :notice => "Successfully logged out!"
  end
end
