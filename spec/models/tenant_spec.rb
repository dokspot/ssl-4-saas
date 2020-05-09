require "rails_helper"

RSpec.describe Tenant, type: :model do
  context "validate" do
    it "presence of name" do
      record = Tenant.new
      record.valid?
      expect(record.errors[:name]).to include("can't be blank")
    end

    it "uniqueness of name" do
      tenant = create(:tenant)
      record = Tenant.new(name: tenant.name)
      record.valid?
      expect(record.errors[:name]).to include("has already been taken")
    end

    it "presence of lets_encrypt" do
      record = Tenant.new
      record.valid?
      expect(record.errors[:lets_encrypt]).to include("can't be blank")
    end
  end
end
