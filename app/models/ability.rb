# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.is_admin?
        can :manage, :all
      else
        can :read, :all
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, User, id: user.id

    can :crud, PersonalIncome do |income|
      user == income.user
    end

    can :crud, PersonalSaving do |saving|
      user == saving.user
    end

    can :crud, FlhModule do |flh_module|
      user == flh_module.user
    end

    can :crud, FlhSocietyQuestion do |question|
      user == question.user
    end

    can :crud, FlhSocietyAnswer do |answer|
      user == answer.user
    end

    can :crud, FlhSocietyLike do |like|
      user == like.user
    end

    can :destroy, FlhSocietyLike do |like|
      user == like.user
    end

  end
end
