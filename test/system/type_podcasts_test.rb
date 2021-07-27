require "application_system_test_case"

class TypePodcastsTest < ApplicationSystemTestCase
  setup do
    @type_podcast = type_podcasts(:one)
  end

  test "visiting the index" do
    visit type_podcasts_url
    assert_selector "h1", text: "Type Podcasts"
  end

  test "creating a Type podcast" do
    visit type_podcasts_url
    click_on "New Type Podcast"

    fill_in "Name", with: @type_podcast.name
    click_on "Create Type podcast"

    assert_text "Type podcast was successfully created"
    click_on "Back"
  end

  test "updating a Type podcast" do
    visit type_podcasts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @type_podcast.name
    click_on "Update Type podcast"

    assert_text "Type podcast was successfully updated"
    click_on "Back"
  end

  test "destroying a Type podcast" do
    visit type_podcasts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type podcast was successfully destroyed"
  end
end
