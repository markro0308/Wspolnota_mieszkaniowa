require "application_system_test_case"

class ResolutionsTest < ApplicationSystemTestCase
  setup do
    @resolution = resolutions(:one)
  end

  test "visiting the index" do
    visit resolutions_url
    assert_selector "h1", text: "Resolutions"
  end

  test "creating a Resolution" do
    visit resolutions_url
    click_on "New Resolution"

    fill_in "Contentr", with: @resolution.contentR
    fill_in "Titler", with: @resolution.titleR
    click_on "Create Resolution"

    assert_text "Resolution was successfully created"
    click_on "Back"
  end

  test "updating a Resolution" do
    visit resolutions_url
    click_on "Edit", match: :first

    fill_in "Contentr", with: @resolution.contentR
    fill_in "Titler", with: @resolution.titleR
    click_on "Update Resolution"

    assert_text "Resolution was successfully updated"
    click_on "Back"
  end

  test "destroying a Resolution" do
    visit resolutions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resolution was successfully destroyed"
  end
end
