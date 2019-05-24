class SpaceshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def update
      record.user == user
    end

    def show
      return true
    end

    def create?
      return true
    end
  end
end
