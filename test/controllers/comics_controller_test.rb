require "test_helper"

class ComicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comics_index_url
    assert_response :success
  end

  test "should get show" do
    get comics_show_url
    assert_response :success
  end

  test "should get new" do
    get comics_new_url
    assert_response :success
  end

  test "should get create" do
    get comics_create_url
    assert_response :success
  end

  test "should get edit" do
    get comics_edit_url
    assert_response :success
  end

  test "should get update" do
    get comics_update_url
    assert_response :success
  end

  test "should get destroy" do
    get comics_destroy_url
    assert_response :success
  end
end
