class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :teacher
      can :create, Comment
      can :read, Tiding
      can :read, User
      can :read, Test
      can :read, TestSetting
    elsif user.has_role? :student
      can :create, Comment
      can :read, Tiding
      can :read, User
    else
      can :create, Comment
      can :read, Tiding
      can :read, User
    end

  end
end
