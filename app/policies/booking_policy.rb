class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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

  def update?
    if record.user == user
      true
    else
      false
    end
  end

  def ads?
    false
  end

  def index?
    true
  end

  def destroy?
    if record.user == user
      true
    else
      false
    end
  end

  def accept_booking?
    if record.user == user
      true
    else
      false
    end
  end
end
