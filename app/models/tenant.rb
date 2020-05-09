class Tenant < ApplicationRecord
  jsonb_accessor :lets_encrypt,
    kid: :string,
    email: :string,
    private_key: :string,
    terms_of_service_agreed: :boolean

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :lets_encrypt, presence: true
  validates :kid, presence: true
  validates :email, presence: true
  validates :private_key, presence: true
  validates :terms_of_service_agreed, presence: true
  validates :terms_of_service_agreed, acceptance: true
end
