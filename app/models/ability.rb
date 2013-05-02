class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role?('admin')
        can :manage, :all
    end
    if user.has_role?('user')
      can :read, Project, :owner => user
      can :create, Project 
      can :update, Project, :owner=>user
      can :read, Task, :project => { :owner => user }
      can :update, Task, :project => {:owner => user }
      can :update_status, Task, :project => {:owner => user }
      can :startwork, Task, :project => {:owner => user}
    end
  end
end
