class Ability
  include CanCan::Ability

  def initialize(user)
    user.can :read, Post
    user.can :update, Post, {user_id: user.id}
    return if user.user?

    user.can :update, Post
    return if user.admin?

    user.can :manage, Post if user.vip?
  end
end
