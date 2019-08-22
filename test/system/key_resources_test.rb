require "application_system_test_case"

class KeyResourcesTest < ApplicationSystemTestCase
  setup do
    @key_resource = key_resources(:one)
  end

  test "visiting the index" do
    visit key_resources_url
    assert_selector "h1", text: "Key Resources"
  end

  test "creating a Best bet" do
    visit key_resources_url
    click_on "New Key Resource"

    fill_in "Created by", with: @key_resource.created_by
    fill_in "Description", with: @key_resource.description
    fill_in "Keywords", with: @key_resource.keywords
    fill_in "Contexts", with: @key_resource.contexts
    fill_in "Categories", with: @key_resource.categories
    fill_in "Title", with: @key_resource.title
    fill_in "Updated by", with: @key_resource.updated_by
    fill_in "Url", with: @key_resource.url
    click_on "Create Best bet"

    assert_text "Best bet was successfully created"
    click_on "Back"
  end

  test "updating a Best bet" do
    visit key_resources_url
    click_on "Edit", match: :first

    fill_in "Created by", with: @key_resource.created_by
    fill_in "Description", with: @key_resource.description
    fill_in "Keywords", with: @key_resource.keywords
    fill_in "Contexts", with: @key_resource.contexts
    fill_in "Categories", with: @key_resource.categories
    fill_in "Title", with: @key_resource.title
    fill_in "Updated by", with: @key_resource.updated_by
    fill_in "Url", with: @key_resource.url
    click_on "Update Best bet"

    assert_text "Best bet was successfully updated"
    click_on "Back"
  end

  test "destroying a Best bet" do
    visit key_resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Best bet was successfully destroyed"
  end
end
