require "test_helper"

class Public::DeletesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get public_deletes_update_url
    assert_response :success
  end
end
