require "test_helper"

class Public::CustmoersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_custmoers_show_url
    assert_response :success
  end

  test "should get update" do
    get public_custmoers_update_url
    assert_response :success
  end

  test "should get edit" do
    get public_custmoers_edit_url
    assert_response :success
  end
end
