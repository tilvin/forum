class QuestionsController < ApplicationController

  before_action :set_questions, only: [:index, :create, :update]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @question = Question.new(params[:question])
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    authorize @question
    @question.save
  end

  def destroy
    authorize @question
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_questions
    @questions = Question.all.order(created_at: :desc)
  end

  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end
end
