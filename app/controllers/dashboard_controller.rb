class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :super_user!, only:[:ttf_leave_application]
  def index
    @user = current_user
  end

  def ttf_leave_application
    @user = current_user
  end
end
