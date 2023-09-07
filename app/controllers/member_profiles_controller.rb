class MemberProfilesController < ApplicationController
    before_action :authenticate_user!
    def profile
        @borrowed_books = User.borrowed_books(current_user)
    end
end
