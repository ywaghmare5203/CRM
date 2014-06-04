require 'spec_helper'

describe User do
  include Authlogic::TestCase

  before(:each) { activate_authlogic }
 
  describe "Validation" do
    it "pass validation with valid attributes" do
      build(:user).should be_valid
    end

    it "is invalid without name" do
      build(:user, name: nil).should_not be_valid
    end

    it "is invalid if name is too short" do
      build(:user, name: 'n').should_not be_valid
    end

    it "is invalid without email" do
      build(:user, email: nil).should_not be_valid
    end

    it "is invalid if email is invalid" do
      build(:user, email: '@singchana.com').should_not be_valid
      build(:user, email: 'bob@localhost').should_not be_valid
    end

    it "is invalid if email is already registered" do
      create(:user, email: 'bob@singchana.com')
      build(:user, email: 'bob@singchana.com').should_not be_valid
    end

    context "when creating new record" do
      it "is invalid without password" do
        build(:user, password: nil).should_not be_valid
      end

      it "is invalid without password confirmation" do
        build(:user, password_confirmation: nil).should_not be_valid
      end

      it "is invalid if password confirmation does not match password" do
        build(:user, password: 'correct', password_confirmation: 'incorrect').should_not be_valid
      end

      it "is invalid if terms condition is refused" do
        build(:user, terms_and_condition: "0").should_not be_valid
      end
    end
  end
end
