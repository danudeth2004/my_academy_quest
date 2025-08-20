RSpec.describe "Quests", type: :system do
  before do
    driven_by(:selenium_chrome)
    @quest = Quest.create!(title: "Test Quest", is_complete: false)
  end

  it "Given_VisitInQuestsLists_When_ReadInPage_Then_SeeOwnNameAndBragButton" do
    visit quests_path

    expect(page).to have_css('[data-testid="profile-name"]')
    expect(page).to have_content("Danudeth Ninkuha (Oat)")
    expect(page).to have_css('[data-testid="link-brag-btn"]')
  end

  it "Given_VisitInQuestsListsAndInputTitle_When_SubmitCreateButton_Then_ShowYourTitleInTitleLists" do
    visit quests_path

    find('[data-testid="quest-title-input"]').set("New Quest")
    find('[data-testid="create-quest-btn"]').click

    expect(page).to have_content("New Quest")
  end

  it "Given_VisitInQuestsListsAndWantToCompleteSomeQuest_When_ClickCheckboxSomeQuest_Then_CompletedQuestAndLineThroughQuest" do
    visit quests_path

    find("[data-testid='checkbox-quest-#{@quest.id}']").check

    expect(page).to have_css("[data-testid='quest-title-#{@quest.id}'].line-through")
  end

  it "Given_VisitInQuestsListsAndWantToDeleteSomeQuest_When_ClickDeleteButton_Then_NotShowQuestIsDeleted" do
    visit quests_path

    accept_confirm do
      find("[data-testid='delete-quest-#{@quest.id}']").click
    end

    expect(page).not_to have_content(@quest.title)
  end
end
