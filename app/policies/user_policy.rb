class UserPolicy < ApplicationPolicy
    attr_reader :user, :user_data
  
    def initialize(user, user_data)
      @user = user
      @user_data = user_data
    end
  
    def archive?
      user.id != user_data.id
    end
  
    def unarchive?
      user.id != user_data.id
    end
end
  