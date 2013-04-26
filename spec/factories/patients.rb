# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    gender "MyString"
  end
end
