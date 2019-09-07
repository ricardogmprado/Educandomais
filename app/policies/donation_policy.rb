class DonationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.project.teacher == user
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
end
