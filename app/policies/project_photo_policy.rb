class ProjectPhotoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def new?
    true
  end

  def edit?
    record.project.teacher == user
  end

  def update?
    edit?
  end

  def destroy?
    record.project.teacher == user
  end
end
