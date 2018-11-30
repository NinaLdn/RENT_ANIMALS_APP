class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    if record.user == user
      true
    else
      false
    end
  end

  def update?
    if record.user == user
      true
    else
      false
    end
  end

  def index?
    true
  end

  def destroy?
    if record.booking.user == user
      true
    else
      false
    end
  end
end
