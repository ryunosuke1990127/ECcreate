require "test_helper"

class Public::DeleteControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get public_delete_update_url
    assert_response :success
  end
end
