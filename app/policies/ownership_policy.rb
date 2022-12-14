class OwnershipPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    record.pet.users.include?(user)
  end

  def create_ownership_from_pet?
    return true
  end
end
