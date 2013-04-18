require 'spec_helper'

describe SessionsController do

  describe 'new action(GET #new)' do
    it 'should display login page' do
      get :new
      response.should be_success
    end
  end

  describe 'create action(POST #create)' do
    context 'with valid login info(username and password)' do
      it 'should be able to log in(setup the session) and redirect to event page' do
        valid_user=create(:valid_user)
        post :create, :username=>valid_user.username, :password=>valid_user.password
        response.should redirect_to events_url
        session[:user_id].should == valid_user.id
      end
    end
    context 'with invalid login info(username and password)' do
      it 'shouldn\'t be able to login and redirect to login page' do
        valid_user=create(:valid_user)
        post :create, :username=>valid_user.username, :password=>'not_valid_user_password'
        response.should redirect_to login_url
        session[:user_id].should eq(nil)
        flash[:alert].should == 'Invalid user/password combination!'
      end
    end
  end

  describe 'destroy action(DELETE #destroy)' do
    it 'should logout(kill the current session) and redirect to login page' do
      delete :destroy
      response.should redirect_to login_url
      session[:user_id].should eq(nil)
      flash[:notice].should == 'Logged out'
    end

  end

end