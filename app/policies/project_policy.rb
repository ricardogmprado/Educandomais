class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    record.teacher == user
  end

  def update?
    edit?
  end

  def destroy?
    record.teacher == user
  end
end
