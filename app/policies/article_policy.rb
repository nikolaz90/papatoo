class ArticlePolicy < ApplicationPolicy
  def show?
    record.status == "published" || edit? || user.admin
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

  def update?
    edit? || user.admin
  end

  def destroy?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
