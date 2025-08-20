RSpec.describe "Application", type: :system do
  before do
    driven_by(:selenium_chrome)
  end

  it "Given_VisitAllPage_When_ClickGitHubLogoButton_Then_OpenGithubRepository" do
    visit root_path

    expect(page).to have_selector('[data-testid="github-tag-btn"]')
    expect(find('[data-testid="github-tag-a"]')[:href]).to eq("https://github.com/danudeth2004/my_academy_quest")

    find('[data-testid="github-tag-a"]').execute_script("this.removeAttribute('target')")
    find('[data-testid="github-tag-btn"]').click

    expect(page).to have_current_path("https://github.com/danudeth2004/my_academy_quest")
  end
end
