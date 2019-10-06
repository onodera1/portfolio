require 'test_helper'

class IndustriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get industries_index_url
    assert_response :success
  end

  test "should get show" do
    get industries_show_url
    assert_response :success
  end

  test "should get new" do
    get industries_new_url
    assert_response :success
  end

  test "should get edit" do
    get industries_edit_url
    assert_response :success
  end

end
