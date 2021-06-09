require "test_helper"

class BidsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bids_index_url
    assert_response :success
  end

  test "should get new" do
    get bids_new_url
    assert_response :success
  end

  test "should get create" do
    get bids_create_url
    assert_response :success
  end
end
