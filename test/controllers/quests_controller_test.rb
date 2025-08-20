require "test_helper"

class QuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quest = quests(:one)
  end

  test "Should be get index" do
    get quests_url
    assert_response :success
  end

  test "Should be create quest" do
    assert_difference("Quest.count") do
      post quests_url, params: { quest: { title: @quest.title, is_complete: @quest.is_complete } }
    end

    assert_redirected_to quests_url
  end

  test "Should be update quest" do
    patch quest_url(@quest), params: { quest: { title: @quest.title, is_complete: @quest.is_complete } }
    assert_redirected_to quests_url
  end

  test "Should be destroy quest" do
    assert_difference("Quest.count", -1) do
      delete quest_url(@quest)
    end

    assert_redirected_to quests_url
  end
end
