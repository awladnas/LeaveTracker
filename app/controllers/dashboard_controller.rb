class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
  end

  def ttf_leave_application
    @user = current_user
  end
end
