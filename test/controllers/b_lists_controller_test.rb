require 'test_helper'

class BListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get b_lists_new_url
    assert_response :success
  end

end
