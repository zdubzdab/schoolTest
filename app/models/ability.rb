class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    end

    if user.has_role? :teacher
      can :manage, :all
    end

    if user.new_record?
      can :read, :all
    else
      #  TODO: temporary ability, need to fix this
      can :manage, Test
    end
  end
end
