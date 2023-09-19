class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome')
    end
    def forget_mailer(user)
        @user = user
        mail(to: @user.email, subject: 'Forget')
    end
    def reset_mailer(user)
        @user = user
        mail(to: @user.email, subject: 'Reset')
    end
end
