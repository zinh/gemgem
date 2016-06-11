require 'test_helper'

class ThingCellTest < Cell::TestCase
  controller ThingsController
  let(:rails){ Thing::Create.(thing: {name: "Rails"}).model }
  let(:trb){ Thing::Create.(thing: {name: "Trailblazer"}).model }
  subject { concept('thing/cell/grid', collection: [trb, rails], last: rails).() }
  it do
    subject.must_have_selector '.columns .header a', text: 'Trailblazer'
    # subject.must_have_selector ".columns.end .header a", text: "Rails"
  end
end
