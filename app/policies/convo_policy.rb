class ConvoPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(receiver: user).or(scope.where(sender: user))
    end
  end
end
