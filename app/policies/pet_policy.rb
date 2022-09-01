class PetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    #scope.where(user[:user])
    def resolve
      user.pets
    end
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    record.users.include?(user)
  end

  def update?
    edit?
  end

  def destroy?
    record.users.include?(user)
  end

  def profile?
    true
  end
end
