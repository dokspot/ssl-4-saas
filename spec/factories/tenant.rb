require "openssl"

FactoryBot.define do
  factory :tenant do
    data {
      {
        name: Faker::Company.name,
        kid: Faker::Internet.uuid,
        email: Faker::Internet.email,
        terms_of_service_agreed: true,
        private_key: OpenSSL::PKey::RSA.new(4096),
      }
    }
  end
end
