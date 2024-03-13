require "application_system_test_case"

class SpacesTest < ApplicationSystemTestCase
  setup do
    @space = spaces(:one)
  end

  test "visiting the index" do
    visit spaces_url
    assert_selector "h1", text: "Spaces"
  end

  test "should create space" do
    visit spaces_url
    click_on "New space"

    fill_in "Address", with: @space.address
    fill_in "City", with: @space.city
    fill_in "Description", with: @space.description
    fill_in "Price per day", with: @space.price_per_day
    fill_in "Price per month", with: @space.price_per_month
    fill_in "Price per week", with: @space.price_per_week
    fill_in "Space profession", with: @space.space_profession
    fill_in "User", with: @space.user_id
    click_on "Create Space"

    assert_text "Space was successfully created"
    click_on "Back"
  end

  test "should update Space" do
    visit space_url(@space)
    click_on "Edit this space", match: :first

    fill_in "Address", with: @space.address
    fill_in "City", with: @space.city
    fill_in "Description", with: @space.description
    fill_in "Price per day", with: @space.price_per_day
    fill_in "Price per month", with: @space.price_per_month
    fill_in "Price per week", with: @space.price_per_week
    fill_in "Space profession", with: @space.space_profession
    fill_in "User", with: @space.user_id
    click_on "Update Space"

    assert_text "Space was successfully updated"
    click_on "Back"
  end

  test "should destroy Space" do
    visit space_url(@space)
    click_on "Destroy this space", match: :first

    assert_text "Space was successfully destroyed"
  end
end
