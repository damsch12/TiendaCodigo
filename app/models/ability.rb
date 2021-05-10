# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read], Product
    can [:create], Question
    
    if !user.nil?
      alias_action :create, :read, :update, :destroy, :to => :crud

      if user.admin?
        can :manage, :all
      else
        can [:read], Question
        can [:index], Favourite
        can [:destroy, :create], Favourite, user: user
      end
    end
  end
end
