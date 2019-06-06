require "application_system_test_case"

class BestBetsTest < ApplicationSystemTestCase
  setup do
    @best_bet = best_bets(:one)
  end

  test "visiting the index" do
    visit best_bets_url
    assert_selector "h1", text: "Best Bets"
  end

  test "creating a Best bet" do
    visit best_bets_url
    click_on "New Best Bet"

    fill_in "Created by", with: @best_bet.created_by
    fill_in "Description", with: @best_bet.description
    fill_in "Keywords", with: @best_bet.keywords
    fill_in "Tags", with: @best_bet.tags
    fill_in "Title", with: @best_bet.title
    fill_in "Updated by", with: @best_bet.updated_by
    fill_in "Url", with: @best_bet.url
    click_on "Create Best bet"

    assert_text "Best bet was successfully created"
    click_on "Back"
  end

  test "updating a Best bet" do
    visit best_bets_url
    click_on "Edit", match: :first

    fill_in "Created by", with: @best_bet.created_by
    fill_in "Description", with: @best_bet.description
    fill_in "Keywords", with: @best_bet.keywords
    fill_in "Tags", with: @best_bet.tags
    fill_in "Title", with: @best_bet.title
    fill_in "Updated by", with: @best_bet.updated_by
    fill_in "Url", with: @best_bet.url
    click_on "Update Best bet"

    assert_text "Best bet was successfully updated"
    click_on "Back"
  end

  test "destroying a Best bet" do
    visit best_bets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Best bet was successfully destroyed"
  end
end
