require "application_system_test_case"

class KeyResourcesTest < ApplicationSystemTestCase
  setup do
    @key_resource = key_resources(:one)
  end

  test "visiting the index" do
    visit key_resources_url
    assert_selector "h1", text: "Key Resources"
  end

  test "creating a Key Resource" do
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
    click_on "Create Key Resource"

    assert_text "Key Resource was successfully created"
    click_on "Back"
  end

  test "updating a Key Resource" do
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
    click_on "Update Key Resource"

    assert_text "Key Resource was successfully updated"
    click_on "Back"
  end

  test "destroying a Key Resource" do
    visit key_resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Key Resource was successfully destroyed"
  end
end
