require 'spec_helper'

describe UserSessionsController do
  before do
    # Stub form referrer location
    @form_referrer = "http://somewhere.com"
    request.stub(:referrer).and_return(@form_referrer)
  end

  describe "GET #new" do
    before { get :new }

    it "return HTTP success" do
      response.should be_success
    end

    it "respond with HTML content" do
      response.content_type.should == "text/html"
    end

    it "render :new view" do
      response.should render_template(:new)
    end

    it "store form referrer location" do
      session[:form_referrer].should == @form_referrer
    end
  end

  describe "POST #create" do
    before(:each) do 
      @user = create(:user)
      session[:form_referrer] = @form_referrer # Stub form referrer
    end

    it "respond with JS content" do
      post :create, user_session: {email: @user.email, password: @user.password}, format: :js
      response.content_type.should == 'text/javascript'
    end
    
    context "if succeed" do
      before { post :create, user_session: {email: @user.email, password: @user.password}, format: :js }

      it "return HTTP success" do
        response.should be_success
      end

      it "render :create view" do
        response.should render_template(:create)
      end

      it "create new user session" do
        @session = UserSession.find
        @session.should be_present
        @session.user.should == @user
      end

      it "assign @redirect_url with form referrer" do
        assigns[:redirect_url].should == @form_referrer
      end
    end

    context "if failed" do
      before { post :create, user_session: {email: @user.email, password: 'wrong_password'}, format: :js }

      it "return HTTP success" do
        response.should be_success
      end

      it "render :create view" do
        response.should render_template(:create)
      end

      it "don't create new user session" do
        UserSession.find.should be_nil
      end
    end

    describe "Remember me functionality" do
      context "if remember_me parameter is set" do
        it "assign cookie user_credentials with expiry date set to session"
      end

      context "if remember_me parameter is not set" do
        it "assign cookie user_credentials with expiry date set to 3 months from now" 
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = create(:user);
      UserSession.create(@user)
      delete :destroy
    end

    it "redirect to root_url" do
      response.should redirect_to(root_url)
    end

    it "respond with HTML content" do
      response.content_type.should == 'text/html'
    end

    it "delete user session" do
      UserSession.find.should be_nil
    end
  end
end
