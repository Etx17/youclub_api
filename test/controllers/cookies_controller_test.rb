require "test_helper"

class CookiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cookies_index_url
    assert_response :success
  end

  test "should get policy" do
    get cookies_policy_url
    assert_response :success
  end
end
