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
      can :read, [Tiding, User, Test, TestSetting]
      can :manage, [TestSetting, MethodicalWork], user_id: user.id
    elsif user.has_role? :student
      can :create, [Comment, Test, Answer]
      can :read, [Test], user_id: user.id
      can :read, [Tiding, User, MethodicalWork, TestSetting]
      can :search_test_settings, [TestSetting]
      can :finish_test, [Test]
    else
      can :create, Comment
      can :read, [Tiding, User, MethodicalWork]
    end
  end
end
