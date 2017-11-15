require 'test_helper'

class BoardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get board_index_url
    assert_response :success
  end

  test "should get filter" do
    get board_filter_url
    assert_response :success
  end

  test "should get sendmail" do
    get board_sendmail_url
    assert_response :success
  end

  test "should get edit" do
    get board_edit_url
    assert_response :success
  end

end
