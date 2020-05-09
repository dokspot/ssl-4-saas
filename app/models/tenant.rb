require "openssl"
require "acme-client"

class Tenant < ApplicationRecord
  jsonb_accessor :data,
    kid: :string,
    email: :string,
    private_key: :string,
    terms_of_service_agreed: :boolean,
    name: :string

  validate :name_uniqueness
  validates :name, presence: true
  validates :email, presence: true
  validates :terms_of_service_agreed, presence: true
  validates :terms_of_service_agreed, acceptance: true

  before_create :create_lets_encrypt_account

  private

  def name_uniqueness
    if Tenant.data_where(name: name).where.not(id: self).exists?
      errors.add(:name, "has already been taken")
    end
  end

  def gen_private_key
    self.private_key = OpenSSL::PKey::RSA.new(4096)
  end

  def create_lets_encrypt_account
    gen_private_key if private_key.nil?
    client = Acme::Client.new(private_key: OpenSSL::PKey::RSA.new(private_key), directory: ENV["LE_DIRECTORY"])
    account = client.new_account(contact: "mailto:#{email}", terms_of_service_agreed: terms_of_service_agreed)
    self.kid = account.kid
  end
end
