class Tenant < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :lets_encrypt, presence: true
end
