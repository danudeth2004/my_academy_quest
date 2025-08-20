require "test_helper"

class QuestTest < ActiveSupport::TestCase
  setup do
    @quest_one = quests(:one)
    @quest_two = quests(:two)
  end

  test "should be quest save when title valid" do
    quest = Quest.new(title: "Academy Ruby Project", is_complete: false)
    assert quest.save
  end

  test "should be quest not save when title invalid" do
    quest = Quest.new(is_complete: false)
    assert_not quest.save
  end

  test "should be show quests order by id minimum to maximum" do
    top = [ @quest_one.id, @quest_two.id ].min
    bottom = [ @quest_one.id, @quest_two.id ].max
    assert_equal [ Quest.find_by(id: top), Quest.find_by(id: bottom) ], Quest.all.to_a
  end
end
