class Ability
  include CanCan::Ability
  def initialize(user)
    return unless user.present?

    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
