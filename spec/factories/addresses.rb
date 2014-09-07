# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    contact nil
  end
end
