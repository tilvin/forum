class AnswersController < ApplicationController

  before_action :set_question
  before_action :set_answers, only: [:create]
  before_action :set_answer, only: [:edit, :update, :destroy]

  def new
    @answer = @question.answers.build
  end

  def create

    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    authorize @answer
    @answer.save
  end

  private

  def set_answers
    @answers = @question.answers
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :content)
  end
end
