require 'test_helper'

class BestBetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @best_bet = best_bets(:one)
  end

  test "should get index" do
    get best_bets_url
    assert_response :success
  end

  test "should get new" do
    get new_best_bet_url
    assert_response :success
  end

  test "should create best_bet" do
    assert_difference('BestBet.count') do
      post best_bets_url, params: { best_bet: { created_by: @best_bet.created_by, description: @best_bet.description, keywords: @best_bet.keywords, tags: @best_bet.tags, title: @best_bet.title, updated_by: @best_bet.updated_by, url: @best_bet.url } }
    end

    assert_redirected_to best_bet_url(BestBet.last)
  end

  test "should show best_bet" do
    get best_bet_url(@best_bet)
    assert_response :success
  end

  test "should get edit" do
    get edit_best_bet_url(@best_bet)
    assert_response :success
  end

  test "should update best_bet" do
    patch best_bet_url(@best_bet), params: { best_bet: { created_by: @best_bet.created_by, description: @best_bet.description, keywords: @best_bet.keywords, tags: @best_bet.tags, title: @best_bet.title, updated_by: @best_bet.updated_by, url: @best_bet.url } }
    assert_redirected_to best_bet_url(@best_bet)
  end

  test "should destroy best_bet" do
    assert_difference('BestBet.count', -1) do
      delete best_bet_url(@best_bet)
    end

    assert_redirected_to best_bets_url
  end
end
