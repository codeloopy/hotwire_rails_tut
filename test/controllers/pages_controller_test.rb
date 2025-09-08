require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "Shoud have a sign in button" do
    get pages_home_url
    assert_select "a", text: "Sign in"
  end
end
