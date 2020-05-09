class App < ApplicationRecord
  jsonb_accessor :data,
    name: :string,
    origin: :string

  belongs_to :tenant

  validate :name_uniqueness
  validates :name, presence: true
  validates :origin, presence: true

  private

  def name_uniqueness
    if !tenant.nil? && tenant.apps.data_where(name: name).where.not(id: self).exists?
      errors.add(:name, "has already been taken")
    end
  end
end
