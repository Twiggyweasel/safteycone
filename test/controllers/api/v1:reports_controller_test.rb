require 'test_helper'

class Api::V1:reportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1:reports_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1:reports_show_url
    assert_response :success
  end

  test "should get new" do
    get api_v1:reports_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1:reports_create_url
    assert_response :success
  end

end
