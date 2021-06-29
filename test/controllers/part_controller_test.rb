require 'test_helper'

class PartControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get part_show_url
    assert_response :success
  end

end
