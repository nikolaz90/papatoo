class MessagePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(convo: @convo)
      scope.all.includes(:convo, :user)

    end
  end
end
