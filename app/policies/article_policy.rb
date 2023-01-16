class ArticlePolicy < ApplicationPolicy
  def my_index?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
