class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.admin
      can :manage, :all
    else
      can :read, :all
      can :create, Comment
      can :destroy, Comment do |comment|
        comment.user == user || comment.item.user == user
      end

      can :read, Project
      can :create, Project
      can :manage, Project do |project|
        project.user == user
      end

      can :create, CategoryProject do |category_project|
        category_project.project.user == user
      end
      can :manage, CategoryProject, project: { user_id: user.id }

      can :create, Note

      can :manage, ProjectUserFollower

      can :manage, Actuality do |actuality|
        actuality.project.user == user
      end
    end
  end
end
