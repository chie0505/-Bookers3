require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get books_update_url
    assert_response :success
  end

end
