class Tenant < ApplicationRecord
  jsonb_accessor :data,
    kid: :string,
    email: :string,
    private_key: :string,
    terms_of_service_agreed: :boolean,
    name: :string

  validate :name_uniqueness
  validates :name, presence: true
  validates :kid, presence: true
  validates :email, presence: true
  validates :private_key, presence: true
  validates :terms_of_service_agreed, presence: true
  validates :terms_of_service_agreed, acceptance: true

  private

  def name_uniqueness
    if Tenant.data_where(name: name).where.not(id: self).exists?
      errors.add(:name, "has already been taken")
    end
  end
end
