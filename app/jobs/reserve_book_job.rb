# frozen_string_literal: true

class ReserveBookJob < ApplicationJob
  queue_as :default

  def perform(user, book)
    ReserveBookNotificationMailer.notify(user, book).deliver_now
  end
end
