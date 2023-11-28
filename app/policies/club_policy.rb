class ClubPolicy < ApplicationPolicy
  class Scope < Scope
    # def resolve
    #   if user.admin?
    #     scope.all
    #   else
    #     scope.where(user: user)
    #   end
    # end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    user.present? && (user == record.user || user.admin?)
  end

  def update?
    user.present? && (user == record.user || user.admin?)
  end

  def create?
    true
  end

  def destroy?
    true
  end



end
