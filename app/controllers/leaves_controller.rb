class LeavesController < ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @leaves = Leave.all
    respond_with(@leaves)
  end

  def show
    respond_with(@leave)
  end

  def new
    @leave = Leave.new
    respond_with(@leave)
  end

  def edit
  end

  def create
    @leave = Leave.new(leave_params)
    @leave.leave_status = 'PENDING'
    @leave.save
    respond_with(@leave)
  end

  def update
    @leave.update(leave_params)
    respond_with(@leave)
  end

  def destroy
    @leave.destroy
    respond_with(@leave)
  end

  def show_leave
    if params[:type].present? && ['sick', 'casual'].include?(params[:type])
      @leaves = current_user.leave.where(:leave_type => params[:type].upcase)
    else
      @leaves = current_user.leave
    end
  end

  private
    def set_leave
      @leave = Leave.find(params[:id])
    end

    def leave_params
      params.require(:leave).merge(:user_id => current_user.id).permit(:user_id, :leave_type, :leave_status, :start_date, :end_date, :content)
    end
end
