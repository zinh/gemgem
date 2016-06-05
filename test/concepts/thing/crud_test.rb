require 'test_helper'
class ThingCrudTest < Minitest::Spec
  describe "Create" do
    it "persists valid" do
      thing = Thing::Create.(thing: {name: "Rails", description: "Web development framework"}).model
      thing.persisted?.must_equal true
      thing.name.must_equal "Rails"
      thing.description.must_equal "Web development framework"
    end

    it "invalid" do
      res, op = Thing::Create.run(thing: {name: ""})
      res.must_equal false
      op.model.persisted?.must_equal false
      op.contract.errors.to_s.must_equal "{:name=>[\"can't be blank\"]}"
    end

    it "invalid description" do
      res, op = Thing::Create.run(thing: {name: "Rails", description: "hi"})
      res.must_equal false
      op.contract.errors.to_s.must_equal "{:description=>[\"is too short (minimum is 4 characters)\"]}"
    end
  end

  describe "Update" do
    let(:thing) {
      Thing::Create.(thing: {name: "Rails", description: "Too much of a framework"}).model
    }

    it "persists valid, ignores name" do
      Thing::Update.(id: thing.id, thing: {name: "Hanami", description: "Description has been changed"})
      thing.reload
      thing.name.must_equal "Rails"
      thing.description.must_equal "Description has been changed"
    end
  end
end
