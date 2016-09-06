require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #new" do
    it "returns http success" do
      user = create(:user)
      question = create(:question, user: user)
      get :new, question_id: question.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "creates a new answer" do
      user = create(:user)
      sign_in user
      question = create(:question, user: user)

      post :create, answer: { user: user, question: question, content: 'content' }, question_id: question.id, format: :js
      expect(Answer.count).to eq(1)
    end
  end
end
