require 'test_helper'

class AudioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get audio_index_url
    assert_response :success
  end

  test "should get stream" do
    get audio_stream_url
    assert_response :success
  end

  test "should get livestream" do
    get audio_livestream_url
    assert_response :success
  end

  test "should get upload" do
    get audio_upload_url
    assert_response :success
  end

end
