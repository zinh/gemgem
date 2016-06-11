# class IntegrationTest < ActionDispatch::IntegrationTest
# end
describe HomeController do
  it do
    Thing::Create.(thing: {name: "Trailblazer", description: "Yet another library"})
    Thing::Create.(thing: {name: "Rails", description: " A MVC web framework"})
    get :index
    assert_select ".columns .header a", "Trailblazer"
    # assert_select ".columns.end .header a", 1
    assert_select ".columns.end .header a", "Rails"
  end
end
