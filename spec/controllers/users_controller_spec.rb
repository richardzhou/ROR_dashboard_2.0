require 'spec_helper'

describe UsersController do

  context 'after successful login' do
=begin  # use this or use below->login_as(:valid_user) with login_as defined in spec_helper.rb
    before(:each) do
      current_user=FactoryGirl.create(:valid_user)
      session[:user_id]||=current_user.id
    end
=end
    before do
      @current_user=FactoryGirl.create(:valid_user)
      login_as(@current_user.username)  # this is a spec helper
    end

    describe 'index action(GET #index)' do
      it 'should render :index view(populate an list of the current users)' do
        current_users=User.all
        get :index
        assigns(:users).should eq(current_users)
        response.should render_template("index")
        response.should be_success
      end
    end

    describe 'show action(GET #show)' do
=begin
      before (:each) do
        @current_user=FactoryGirl.create(:valid_user)
      end
=end
      it 'should assign the requested user to @user' do
        get :show, :id=>@current_user
        assigns(:user).should eq(@current_user)
      end
      it 'should render #show view(show this user)' do
        get :show, :id=>@current_user.id
        response.should render_template :show
        response.should be_success
      end
    end

    describe 'new action(GET #new)' do
      it 'should render #new view(the form to create a new user)' do
        get :new
        response.should render_template :new
        response.should be_success
      end
    end

    describe 'create action(POST #create)' do
      context 'with valid attributes' do
        it 'should create a new user' do
          expect{
            post :create, :user=>FactoryGirl.attributes_for(:another_valid_user)
          }.to change(User,:count).by(1)
        end
        it 'should redirect to this new created user' do
          post :create, :user=>FactoryGirl.attributes_for(:another_valid_user)
          response.should redirect_to User.last
          flash[:notice].should == 'New user another_valid_username was successfully created!'
          #response.should be_success  # redirect_to is not 'response.should be_success'
        end
      end
      context 'with invalid attributes' do
        it 'shouldn\'t save this user' do
          expect{
            post :create, :user=>FactoryGirl.attributes_for(:invalid_user)
          }.to_not change(User,:count)
        end
        it 'should re-render the new view(the form to create a new user)' do
          post :create, :user=>FactoryGirl.attributes_for(:invalid_user)
          response.should render_template :new
          response.should be_success
        end
      end
    end

    describe 'update action(PUT #update)' do
=begin
      before (:each) do
        @current_user=FactoryGirl.create(:valid_user)
      end
=end
      context 'with valid attributes' do
        it 'should locate the requested @user' do
          put :update, :id=>@current_user, :user=>FactoryGirl.attributes_for(:valid_user, :username=>'updated_username')
          assigns(:user).should eq(@current_user)
        end
        it 'should change @user\'s attributes' do
          put :update, :id=>@current_user, :user=>FactoryGirl.attributes_for(:valid_user, :username=>'updated_username')
          @current_user.reload
          @current_user.username.should eq('updated_username')
        end
        it 'should redirect to the updated user' do
          put :update, :id=>@current_user, :user=>FactoryGirl.attributes_for(:valid_user, :username=>'updated_username')
          response.should redirect_to @current_user
          flash[:notice].should == 'This user was successfully updated!'
        end
      end
      context 'with invalid attributes' do
        it 'should locate the requested @user' do
          put :update, :id=>@current_user, :user=>FactoryGirl.attributes_for(:invalid_user)
          assigns(:user).should eq(@current_user)
        end
        it 'shouldn\'t change @user\'s attributes' do
          put :update, :id=>@current_user, :user=>FactoryGirl.attributes_for(:invalid_user)
          @current_user.reload
          @current_user.username.should eq('any_valid_username')
        end
        it 'should re-render the edit view(the form to update an existing  uder)' do
          put :update, :id=>@current_user, :user=>FactoryGirl.attributes_for(:invalid_user)
          response.should render_template :edit
          response.should be_success
        end
      end
    end

    describe 'destroy action(DELETE #destroy)' do
=begin
      before (:each) do
        @current_user=FactoryGirl.create(:valid_user)
      end
=end
      before (:each) do   # @current_user was created first, we create @another_user to make sure User.count>0 after destroying one of them(either @current_user or @another_user)
        @another_user=FactoryGirl.create(:another_valid_user)
      end
      it 'should delete that selected user' do
        expect{
          delete :destroy, :id=>@another_user
        }.to change(User, :count).by(-1)
      end
      it 'should redirect to index view(a list of all current users)' do
        delete :destroy, :id=>@another_user
        response.should redirect_to users_url
        flash[:notice].should == "User #{@another_user.username} deleted!"
      end

    end

  end

  context 'if login failed' do
    it 'should redirect to login page' do
      logout # this is a spec helper, <=> session[:user_id]=nil
      get :index
      response.should redirect_to(login_url)
      flash[:notice].should == 'Please log in first!'
    end
  end

end