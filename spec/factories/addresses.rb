# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "123 Main St."
    city "Somewhere"
    state "CA"
    zip "76291"

    factory :address_two do
      street "777 Side St."
      city "Anywhere"
      state "NY"
      zip "17820"
    end
  end
end
