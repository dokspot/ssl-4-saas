FactoryBot.define do
  factory :app do
    tenant { build(:tenant) }
    data {
      {
        name: Faker::App.name,
        origin: Faker::Internet.domain_name,
      }
    }
  end
end
