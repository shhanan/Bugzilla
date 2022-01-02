require "test_helper"

class BugzillasControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get bugzillas_home_url
    assert_response :success
  end
end
