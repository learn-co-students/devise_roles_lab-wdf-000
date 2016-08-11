class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    alias_action :index, :sign_in, :sign_out, :to => :nav
    can :nav, User
    can :show, User, :id => user.id
    if user.admin?
      can :manage, Post
      can :manage, User
    elsif user.vip?
      can :read, :update, Post
    end
  end

end
