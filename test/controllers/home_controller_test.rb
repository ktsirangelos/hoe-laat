require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Include Devise helpers

  test "should get index" do
    sign_in users(:one)
    get root_url
    assert_response :success
  end
end
