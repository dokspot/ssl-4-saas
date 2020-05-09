require "openssl"

FactoryBot.define do
  factory :tenant do
    name { Faker::Company.name }
    lets_encrypt {
      {
        email: Faker::Internet.email,
        terms_of_service_agreed: true,
        private_key: OpenSSL::PKey::RSA.new(4096),
        kid: Faker::Internet.uuid,
      }
    }
  end
end
