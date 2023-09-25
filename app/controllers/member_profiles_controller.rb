class MemberProfilesController < ApplicationController
  before_action :authenticate_user!
  def profile
    @borrowed_books = User.borrowed_books(current_user)
   
  end
  def user_detail
    @users = User.all
  end
  def destroy_user
    # super
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "successfully deleted"
    redirect_to '/user_details'
  end
end
