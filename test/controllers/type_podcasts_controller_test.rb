require 'test_helper'

class TypePodcastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_podcast = type_podcasts(:one)
  end

  test "should get index" do
    get type_podcasts_url
    assert_response :success
  end

  test "should get new" do
    get new_type_podcast_url
    assert_response :success
  end

  test "should create type_podcast" do
    assert_difference('TypePodcast.count') do
      post type_podcasts_url, params: { type_podcast: { name: @type_podcast.name } }
    end

    assert_redirected_to type_podcast_url(TypePodcast.last)
  end

  test "should show type_podcast" do
    get type_podcast_url(@type_podcast)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_podcast_url(@type_podcast)
    assert_response :success
  end

  test "should update type_podcast" do
    patch type_podcast_url(@type_podcast), params: { type_podcast: { name: @type_podcast.name } }
    assert_redirected_to type_podcast_url(@type_podcast)
  end

  test "should destroy type_podcast" do
    assert_difference('TypePodcast.count', -1) do
      delete type_podcast_url(@type_podcast)
    end

    assert_redirected_to type_podcasts_url
  end
end
