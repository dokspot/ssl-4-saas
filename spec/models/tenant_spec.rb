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

    it "uniqueness of name", vcr: { cassette_name: "account_new" } do
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

  context "create" do
    let (:tenant) { create(:tenant) }

    it "a let encrypt account", vcr: { cassette_name: "account_new" } do
      expect(tenant.private_key).to include("BEGIN RSA PRIVATE KEY")
      expect(tenant.private_key).to include("END RSA PRIVATE KEY")
      expect(tenant.kid).to be_truthy
    end
  end

  context "methods" do
    let (:tenant) { create(:tenant) }

    it "should provide a client", vcr: { cassette_name: "account_new" } do
      client = tenant.client
      expect(client.kid).to eq(tenant.kid)
    end
  end
end
