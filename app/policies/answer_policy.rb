class AnswerPolicy < ApplicationPolicy
  attr_reader :user, :answer
  def initialize(user, answer)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @answer = answer
    end

    def create?
      user
    end
end