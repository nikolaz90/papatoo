class ArticlePolicy < ApplicationPolicy
  def show?
    true
  end

  def my_index?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
