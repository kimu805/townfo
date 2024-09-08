require "test_helper"

class CircularsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get circulars_index_url
    assert_response :success
  end

  test "should get new" do
    get circulars_new_url
    assert_response :success
  end

  test "should get show" do
    get circulars_show_url
    assert_response :success
  end
end
