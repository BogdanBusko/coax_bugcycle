class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all 

    if user && user.admin?
      can :dashboard, :all
      can :access, :rails_admin
    end
  end
end
