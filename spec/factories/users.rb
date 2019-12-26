require "faker"

FactoryBot.define do
  factory :user, class: "User" do
    first_name { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
  end
end
