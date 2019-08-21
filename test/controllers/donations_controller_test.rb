require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get donations_show_url
    assert_response :success
  end

  test "should get create" do
    get donations_create_url
    assert_response :success
  end

  test "should get update" do
    get donations_update_url
    assert_response :success
  end

  test "should get edit" do
    get donations_edit_url
    assert_response :success
  end

end
