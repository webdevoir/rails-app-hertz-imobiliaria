require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  test "serve response correctly" do
    get "/"
    assert_response :success
  end
end
