class ReserveBookNotificationMailer < ApplicationMailer
    def notify(user, book)
        @user = user
        @book = book
        mail(to: @user.email, subject: "Book is Available")
    end
end
