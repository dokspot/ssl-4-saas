require "rails_helper"

RSpec.describe Tenant, type: :model do
  context "validate" do
    before(:each) do
      @record = Tenant.new
      @record.valid?
    end

    it "presence of name" do
      expect(@record.errors[:name]).to include("can't be blank")
    end

    it "presence of email" do
      expect(@record.errors[:email]).to include("can't be blank")
    end

    it "presence of terms_of_service_agreed" do
      expect(@record.errors[:terms_of_service_agreed]).to include("can't be blank")
    end

    it "presence of private_key" do
      expect(@record.errors[:private_key]).to include("can't be blank")
    end

    it "presence of kid" do
      expect(@record.errors[:kid]).to include("can't be blank")
    end

    it "uniqueness of name" do
      tenant = create(:tenant)
      @record = Tenant.new(name: tenant.name)
      @record.valid?
      expect(@record.errors[:name]).to include("has already been taken")
    end

    it "acceptance of terms_of_service_agreed" do
      @record = Tenant.new(terms_of_service_agreed: false)
      @record.valid?
      expect(@record.errors[:terms_of_service_agreed]).to include("must be accepted")
    end
  end
end
