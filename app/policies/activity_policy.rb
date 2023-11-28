class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    user.present? && (user == record.club.user || user.admin?)
  end

  def update?
    user.present? && (user == record.club.user || user.admin?)
  end

  def create?
    true
  end

  def destroy?
    user.present? && (user == record.club.user || user.admin?)
  end

end
