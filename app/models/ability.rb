# frozen_string_literal: true

# Permissions definitions for cancancan
class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read], Product
    can [:create], Question

    unless user.nil?
      alias_action :create, :read, :update, :destroy, to: :crud

      if user.admin?
        can :manage, :all
      else
        can [:read], Question
        can [:index], Favourite
        can %i[destroy create], Favourite, user: user
      end
    end
  end
end
