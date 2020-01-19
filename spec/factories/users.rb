require "faker"

FactoryBot.define do
  factory :user, class: "User" do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    # Use example.com address
    email { Faker::Internet.unique.safe_email }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    # Faker's zip code method returns an integer of varying length so not suitable
    postcode { Faker::Number.number(digits: 5) }
    country { "United States" }
    phone { Faker::PhoneNumber.cell_phone }
    password { "password1" }
  end
end
