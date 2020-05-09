require "openssl"

FactoryBot.define do
  factory :tenant do
    data {
      {
        name: Faker::Company.name,
        email: Faker::Internet.email,
        terms_of_service_agreed: true,
      }
    }
  end
end
