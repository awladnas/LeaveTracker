class DashboardController < ApplicationController
  before_action :auth_user
  before_action :super_user!, only:[:ttf_leave_application]
  def index
    @user = current_user
  end

  def ttf_leave_application
    @user = current_user
  end

  def auth_user
    redirect_to '/login' unless user_signed_in?
  end
end
