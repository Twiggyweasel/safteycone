require 'test_helper'

class Api::V1::SafetychecksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_safetychecks_index_url
    assert_response :success
  end

end
