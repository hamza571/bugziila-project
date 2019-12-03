require 'test_helper'

class ProjectusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get projectusers_index_url
    assert_response :success
  end

end
