class OverDueNotificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    OverDueBookNotificationMailer.over_due_notify(user).deliver_now

  end
end
