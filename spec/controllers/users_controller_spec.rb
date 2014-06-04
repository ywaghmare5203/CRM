require 'spec_helper'

describe UsersController do
  before do
    # Stub Form referrer location
    @form_referrer = "http://somewhere.com" 
    request.stub(:referrer).and_return @form_referrer
  end

  describe "GET #new" do
    before { get :new } 

    it "return HTTP success" do
      response.should be_success
    end

    it "respond with HTML content" do
      response.content_type.should == 'text/html'
    end

    it "render :new view" do
      response.should render_template(:new)
    end

    it "store form referrer location" do
      session[:form_referrer].should == @form_referrer
    end
  end
  
  describe "POST #create" do
    before do
      @initial_user_count = User.count
      session[:form_referrer] = @form_referrer
    end

    it "respond with JS content" do
      post :create, format: :js
      response.content_type.should == 'text/javascript'
    end

    context "if succeed" do
      before { post :create, user: attributes_for(:user), format: :js }

      it "return HTTP success" do
        response.should be_success
      end
    
      it "render :create view" do
        response.should render_template(:create)
      end


      it "create new user" do
        User.count.should == (@initial_user_count + 1)
      end

      it "assign @redirect_url with form referrer" do
        assigns[:redirect_url].should == @form_referrer
      end
    end

    context "if failed" do
      before { post :create, user: attributes_for(:invalid_user), format: :js }

      it "return HTTP success" do
        response.should be_success
      end

      it "render :create view" do
        response.should render_template(:create)
      end

      it "don't create new user" do
        User.count.should_not == (@initial_user_count + 1)
      end
    end
  end
end
