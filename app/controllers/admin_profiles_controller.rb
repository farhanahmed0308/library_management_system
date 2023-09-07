class AdminProfilesController < ApplicationController
    def profile
    end
    def user_detail
        @users = User.all
    end
    def destroy_user
        # super
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/user_detail_path'
    end
end
