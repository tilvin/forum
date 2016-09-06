class QuestionPolicy
  attr_reader :user, :question

  def initialize(user, question)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @question = question
  end

  def destroy?
    user == question.user
  end

  def create?
    user
  end
end