class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :manager
      can :manage, :all
    else
      can :read, :all
      can :create, Project
      can :edit, Project
      can :update, Project
      can :destroy, Project do |project|
        Project.try(:user) == user || user.role?(:manager)
      end

      if user.role?(:developer)


        end


      if user.role?(:qa)
        can :create, Bug
        can :destroy, Bug do |bug|
          Bug.try(:user) == user
        end
      end
    end





  end




end
