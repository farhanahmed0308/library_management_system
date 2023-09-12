class OverDueBookNotificationMailer < ApplicationMailer
    def over_due_notify(user)
        @user = user
        mail(to: @user.email, subject: "Book is Available")
    end
end
