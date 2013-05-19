require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get place_order" do
    get :place_order
    assert_response :success
  end

  test "should get thank_you/checkout" do
    get :thank_you/checkout
    assert_response :success
  end

end
