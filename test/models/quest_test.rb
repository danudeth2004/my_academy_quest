require "test_helper"

class QuestTest < ActiveSupport::TestCase
  test "should be quest save when title valid" do
    quest = Quest.new(title: "Academy Ruby Project", is_complete: false)
    assert quest.save
  end

  test "should be quest not save when title invalid" do
    quest = Quest.new(is_complete: false)
    assert_not quest.save
  end
end
