require "test_helper"

class PendingMembershipsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pending_memberships_new_url
    assert_response :success
  end
end
