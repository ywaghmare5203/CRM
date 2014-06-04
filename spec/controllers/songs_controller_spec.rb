require 'spec_helper'

describe SongsController do
  before(:each) { @song_count = 10; create_list(:song, @song_count) }

  describe "GET #index" do
    before { get :index }
    
    it "return HTTP success" do
      response.should be_success
    end

    it "respond with HTML content" do
      response.content_type.should == 'text/html'
    end

    it "render :index view" do
      response.should render_template(:index)
    end
  end

  describe "GET #search" do
    it "respond with HTML content" do
      get :search, query: 'string'
      response.content_type.should == 'text/html'
    end

    context "if search parameter is provided" do
      before do 
        # Pick random song for test subject
        @song = Song.offset(rand(Song.count)).first
        get :search, query: @song.title
      end

      it "return HTTP success" do
        response.should be_success
      end

      it "render search_result view" do
        response.should render_template('search_result')
      end

      it "assign @songs" do
        assigns[:songs].should be_present
        assigns[:songs].should include(@song)
      end
    end

    context "if search parameter is not provided" do
      before { get :search }

      it "return HTTP error" do
        response.should be_client_error
      end

      it "render shared/error view" do
        response.should render_template('shared/error')
      end
    end
  end
end
