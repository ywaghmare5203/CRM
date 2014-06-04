require 'spec_helper'

describe ApplicationController do
  # Enable authlogic testing suite
  include Authlogic::TestCase
  before(:each) { activate_authlogic }

  controller do 
    before_filter :require_login, only: :new
    
    def index; end
    def new; end
    def create; end
  end

  describe "#restrict_alpha_access" do  
    before(:each) { Rails.env.stub(:production?).and_return(true) }
    
    it "restrict access for anonymous user" do
      get :index
      response.should redirect_to '/maintenance.html'
    end

    it "allow access for registered & logged in user" do
      UserSession.create(create(:user)) # Create user & login

      get :index
      response.should be_success
    end
  end

  describe "#require_login" do
    context "if user is logged in" do
      before { @user = create(:user); UserSession.create(@user); get :new }
    
      it "return HTTP success" do
        response.should be_success
      end

      it "assign @current_user" do
        assigns[:current_user].should == @user
      end
    end

    context "if user is not logged in" do
      context "if HTML content type is expected" do
        before { get :new }

        it "redirect to login page" do
          response.should redirect_to(new_user_session_url)  
        end
      end

      context "if other content type is expected" do
        let(:formats) {[:js, :xml, :json]}

        it "return HTTP error" do
          formats.each do |format| 
            get :new, format: format
            response.should be_client_error
          end
        end
      end
    end
  end

  describe "#render_error" do
    controller { def index; render_error('message'); end; }
    before { get :index }

    it "return HTTP error" do
      response.should be_client_error
    end

    it "render shared/error view" do
      response.should render_template('shared/error')
    end

    it "assign @error" do
      assigns[:error].should be_present
    end
  end
  
  context "if page requested through XHR" do
    it "doesn't render application layout" do
      xhr :get, :index
      response.should_not render_template('layouts/application.html.erb')
    end
  end
end
