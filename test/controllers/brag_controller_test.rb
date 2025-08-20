require "test_helper"

class BragControllerTest < ActionDispatch::IntegrationTest
  test "Should be get index" do
    get brag_url
    assert_response :success
  end
end
