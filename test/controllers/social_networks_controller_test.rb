require 'test_helper'

class SocialNetworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_network = social_networks(:one)
  end

  test "should get index" do
    get social_networks_url
    assert_response :success
  end

  test "should get new" do
    get new_social_network_url
    assert_response :success
  end

  test "should create social_network" do
    assert_difference('SocialNetwork.count') do
      post social_networks_url, params: { social_network: { name: @social_network.name, url: @social_network.url } }
    end

    assert_redirected_to social_network_url(SocialNetwork.last)
  end

  test "should show social_network" do
    get social_network_url(@social_network)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_network_url(@social_network)
    assert_response :success
  end

  test "should update social_network" do
    patch social_network_url(@social_network), params: { social_network: { name: @social_network.name, url: @social_network.url } }
    assert_redirected_to social_network_url(@social_network)
  end

  test "should destroy social_network" do
    assert_difference('SocialNetwork.count', -1) do
      delete social_network_url(@social_network)
    end

    assert_redirected_to social_networks_url
  end
end
