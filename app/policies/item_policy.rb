class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def create?
    user.seller? || user.admin?
  end
end
