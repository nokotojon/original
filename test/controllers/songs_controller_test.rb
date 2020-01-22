require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get songs_new_url
    assert_response :success
  end

end
