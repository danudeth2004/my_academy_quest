require "rails_helper"

RSpec.describe "Quests", type: :request do
  setup do
    @quest = Quest.create!(title: "Test Quest", is_complete: false)
  end

  describe "GET /quests" do
    it "Should be get index return success" do
      get quests_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Quests")
    end
  end

  describe "POST /quests" do
    it "Should be create quest and redirect to quests path" do
      expect {
        post quests_path, params: { quest: { title: "New Quest", is_complete: false } }
      }.to change(Quest, :count).by(1)

      expect(response).to redirect_to(quests_path)
    end
  end

  describe "PATCH /quests/:id" do
    it "Should be update quest params is_complete" do
      patch quest_path(@quest), params: { quest: { is_complete: true } }

      expect(response).to redirect_to(quests_path)
      expect(@quest.reload.is_complete).to be(true)
    end
  end

  describe "DELETE /quests/:id" do
    it "Should be delete quest" do
      expect {
        delete quest_path(@quest)
      }.to change(Quest, :count).by(-1)

      expect(response).to redirect_to(quests_path)
    end
  end
end

RSpec.describe "Brag", type: :request do
  describe "GET /brag" do
    it "Should be get index return success" do
      get brag_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Oat (2025)")
    end
  end
end
