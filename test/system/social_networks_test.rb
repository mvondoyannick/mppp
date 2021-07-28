require "application_system_test_case"

class SocialNetworksTest < ApplicationSystemTestCase
  setup do
    @social_network = social_networks(:one)
  end

  test "visiting the index" do
    visit social_networks_url
    assert_selector "h1", text: "Social Networks"
  end

  test "creating a Social network" do
    visit social_networks_url
    click_on "New Social Network"

    fill_in "Name", with: @social_network.name
    fill_in "Url", with: @social_network.url
    click_on "Create Social network"

    assert_text "Social network was successfully created"
    click_on "Back"
  end

  test "updating a Social network" do
    visit social_networks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @social_network.name
    fill_in "Url", with: @social_network.url
    click_on "Update Social network"

    assert_text "Social network was successfully updated"
    click_on "Back"
  end

  test "destroying a Social network" do
    visit social_networks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social network was successfully destroyed"
  end
end
