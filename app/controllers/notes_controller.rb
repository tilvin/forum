class NotesController < ApplicationController

  before_action :set_question
  before_action :set_answer
  before_action :set_note, only: [:destroy, :agree, :disagree]
  before_action :set_notes, only: [:create]

  def new
    @note = @answer.notes.build
  end

  def create
    @note = @answer.notes.new(note_params)
    authorize @note
    @note.user = current_user
    @note.save
    puts @note.errors.full_messages
  end

  def agree
    @note.update(agreement: true)
    redirect_to questions_path, notice: 'note was successfully agree.'
  end

  def disagree
    @note.update(agreement: false)
    redirect_to questions_path, notice: 'note was successfully disagree.'
  end

  private

  def set_notes
    @notes = @answer.notes
  end

  def set_note
    @note = Note.find(params[:id] || params[:note_id])
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def note_params
    params.require(:note).permit(:user_id, :answer_id, :content)
  end

end
