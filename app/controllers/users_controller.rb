class UsersController < ApplicationController
  respond_to :html, :only=> [:new]
  respond_to :js, :only=> [:create]

  def new
    session[:form_referrer] = request.referrer
    respond_with(@user = User.new)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User (#{@user.email}) signed up!"
      @redirect_url = session[:form_referrer] || root_url
    end

    respond_with @user
  end
end
