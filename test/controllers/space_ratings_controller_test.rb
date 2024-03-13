require "test_helper"

class SpaceRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get space_ratings_create_url
    assert_response :success
  end
end
