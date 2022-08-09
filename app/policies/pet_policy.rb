class PetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def edit?
    user == record.user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user
  end
end
