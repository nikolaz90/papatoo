class PortfolioArticlePolicy < ApplicationPolicy
  def index?
    user.admin
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def destroy?
    index?
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
