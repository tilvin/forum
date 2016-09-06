require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  include Devise::Test::ControllerHelpers

  before :each do
    sign_in @user = create(:user)
    @question = create(:question, user: @user)
    @answer = create(:answer, question: @question, user: @user)
    @note = create(:note, answer: @answer, user: @user)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, question_id: @question.id, answer_id: @answer.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "creates a new note" do
      post :create, note: { answer: @answer, user: @user, content: 'content' },
                    question_id: @question.id, answer_id: @answer.id, format: :js
      expect(Note.count).to eq(2)
    end
  end

  describe "PUT #agree" do
    it "change agreement to true" do
      note = create(:note, answer: @answer, user: @user)
      put :agree, note_id: note.id, question_id: @question.id, answer_id: @answer.id
      expect(note.reload.agreement).to eq true
    end
  end
end
