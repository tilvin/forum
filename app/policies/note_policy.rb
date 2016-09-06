class NotePolicy < ApplicationPolicy

  def initialize(user, note)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @note = note
  end

  def create?
    user
  end
end
