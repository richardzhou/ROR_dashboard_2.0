SALT="my_salt" unless defined?(SALT)

FactoryGirl.define do
  factory :valid_user, :class =>:User do
    username "any_valid_username"
    #hashed_password "<%= User.encrypt_password('Meetaic2012', SALT) %>"
    #salt "<%= SALT %>"
    password "Meetaic2012"
    password_confirmation "Meetaic2012"
  end

  factory :another_valid_user, :class =>:User do
    username "another_valid_username"
    #hashed_password "<%= User.encrypt_password('Meetaic2012', SALT) %>"
    #salt "<%= SALT %>"
    password "Meetaic2012"
    password_confirmation "Meetaic2012"
  end

  factory :invalid_user_with_username_nil, :class =>:User do
    username ""
    #hashed_password "MyString"
    #salt "MyString"
    password "123"
    password_confirmation "123"
  end

  factory :invalid_user_with_password_nil, :class =>:User do
    username "any_username"
    password ""
    password_confirmation ""
  end

  factory :invalid_user_with_password_confirmation_nil, :class =>:User do
    username"user"
    password "123456"
    password_confirmation ""
  end

  factory :invalid_user_with_two_different_password_inputs, :class =>:User do
    username "any_username"
    #hashed_password "MyString"
    #salt "MyString"
    password "123"
    password_confirmation "1234"
  end

  factory :user6, :class =>:User do
    username "user6"
    hashed_password "MyString"
    salt "MyString"
  end

  factory :invalid_user, parent: :valid_user do
    username nil
    hashed_password nil
    salt nil
  end
end