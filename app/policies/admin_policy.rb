class AdminPolicy < ApplicationPolicy
  def articles_for_validation?
    user.admin
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
