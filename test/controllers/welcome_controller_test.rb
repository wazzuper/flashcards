require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get message" do
    get welcome_message_url
    assert_response :success
  end

end
