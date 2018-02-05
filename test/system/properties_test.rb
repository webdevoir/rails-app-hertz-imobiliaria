require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  test "visting the index" do
    get "/"
    assert_response :success
  end
end
