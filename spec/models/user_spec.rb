require 'spec_helper'

describe User do

  context "when initialized" do

    it "should be valid with correct attributes" do
      user = FactoryGirl.build(:valid_user)
      user.should be_valid
    end

    it "should be invalid if username not present" do
      user = FactoryGirl.build(:invalid_user_with_username_nil)
      user.should be_invalid
      user.should have(1).errors_on(:username)
      user.errors[:username].join('; ').should == 'can\'t be blank'
    end

    it "should be invalid if password not present" do
      user = FactoryGirl.build(:invalid_user_with_password_nil)
      user.should be_invalid
      user.should have(1).errors_on(:password)
      user.errors[:password].join('; ').should == 'Missing password'
    end

    it "should be invalid if password_confirmation not present" do
      user = FactoryGirl.build(:invalid_user_with_password_confirmation_nil)
      user.should be_invalid
      user.should have(1).errors_on(:password)
      user.errors[:password].join('; ').should == 'doesn\'t match confirmation'
    end

    it "should be invalid without a valid password confirmation(two password inputs don't match)" do
      user = FactoryGirl.build(:invalid_user_with_two_different_password_inputs)
      user.should be_invalid
      user.should have(1).errors_on(:password)
      user.errors[:password].join('; ').should == 'doesn\'t match confirmation'
    end

    it "should be invalid with duplicate username" do
      existing_valid_user = FactoryGirl.create(:valid_user) # if User.find_by_username('rzhou').nil?
      user = FactoryGirl.build(:valid_user)
      user.should be_invalid
      user.should have(1).errors_on(:username)  #结果会有关于username一个错误。
      user.errors[:username].join('; ').should == 'has already been taken'
    end
  end

  describe ".authenticate" do  # User.authenticate is a public class method
    it "should pass user authentication if username and password are valid" do
      existing_valid_user = FactoryGirl.create(:valid_user)
      User.authenticate(existing_valid_user.username,existing_valid_user.password).should == User.find_by_username(existing_valid_user.username)
    end
    it "should fail user authentication if username and password are invalid" do
      existing_valid_user = FactoryGirl.create(:valid_user)
      User.authenticate(existing_valid_user.username,'invalid_password').should_not == User.find_by_username(existing_valid_user.username)
    end
  end

end
