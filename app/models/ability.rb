# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'agent'
        can :update, Property do |property|
            property.user == user
        end
        can :destroy, Property do |property|
            property.user == user
        end
        can :manage, Property do |property|
            property.user == user
        end

        can :create, Property
        
    elsif user.role == 'customer'
        can :manage, Property

        can :manage, Review do |review|
            review.user == user
        end
        can :destroy, Review do |review|
            review.user == user
        end
        can :create, Review
    end

  end
end
