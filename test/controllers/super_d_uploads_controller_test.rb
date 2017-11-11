require 'test_helper'

class SuperDUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @super_d_upload = super_d_uploads(:one)
  end

  test "should get index" do
    get super_d_uploads_url
    assert_response :success
  end

  test "should get new" do
    get new_super_d_upload_url
    assert_response :success
  end

  test "should create super_d_upload" do
    assert_difference('SuperDUpload.count') do
      post super_d_uploads_url, params: { super_d_upload: { body: @super_d_upload.body, title: @super_d_upload.title } }
    end

    assert_redirected_to super_d_upload_url(SuperDUpload.last)
  end

  test "should show super_d_upload" do
    get super_d_upload_url(@super_d_upload)
    assert_response :success
  end

  test "should get edit" do
    get edit_super_d_upload_url(@super_d_upload)
    assert_response :success
  end

  test "should update super_d_upload" do
    patch super_d_upload_url(@super_d_upload), params: { super_d_upload: { body: @super_d_upload.body, title: @super_d_upload.title } }
    assert_redirected_to super_d_upload_url(@super_d_upload)
  end

  test "should destroy super_d_upload" do
    assert_difference('SuperDUpload.count', -1) do
      delete super_d_upload_url(@super_d_upload)
    end

    assert_redirected_to super_d_uploads_url
  end
end
