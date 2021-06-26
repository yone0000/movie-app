require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get review_user:references_url
    assert_response :success
  end

  test "should get article:references" do
    get review_article:references_url
    assert_response :success
  end

  test "should get score:integer" do
    get review_score:integer_url
    assert_response :success
  end

end
