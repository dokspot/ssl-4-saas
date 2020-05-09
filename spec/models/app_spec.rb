require "rails_helper"

RSpec.describe App, type: :model do
  context "validate" do
    before(:each) do
      @record = App.new
      @record.valid?
    end

    it "presence of tenant" do
      expect(@record.errors[:tenant]).to include("must exist")
    end

    it "presence of name" do
      expect(@record.errors[:name]).to include("can't be blank")
    end

    it "presence of origin" do
      expect(@record.errors[:origin]).to include("can't be blank")
    end

    it "uniqueness of name" do
      app = create(:app)
      @record = App.new(name: app.name, tenant: app.tenant)
      @record.valid?
      expect(@record.errors[:name]).to include("has already been taken")
    end
  end
end
