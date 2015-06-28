class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "welcome"
    else
      "application"
    end
  end

  def authenticate_super_user!
    if @leave.present? && @leave.user.supervisor == current_user.id
      true
    else
      redirect_to root_url
    end
  end

  def super_user!
    if User.where(:supervisor => current_user.id).count > 0
      true
    else
      redirect_to root_url
    end
  end
end
