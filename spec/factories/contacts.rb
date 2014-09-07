# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "Rob Love"
  end
  factory :contact_two, class: Contact do
    name "Jim Shore"
  end
end
