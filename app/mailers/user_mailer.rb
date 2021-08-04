class UserMailer < ApplicationMailer
    def user_status_notification(user)
        @user = user
        mail(to: user.email, subject: 'User Status')
    end
end
