class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.seller?
        scope.where(user_id: user.id)
      end
    end
  end
  
  def create?
    user.seller? || user.admin?
  end
  
  def destroy?
    return true if (record.user_id === user) || user.admin?
  end
  
  def update?
    record.user_id === user || user.admin?
  end
end
