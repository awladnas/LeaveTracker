class LeavesController < ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  before_action :authenticate_user!

  before_action :authenticate_super_user!, :only => [:update, :edit, :show]

  respond_to :html, :js

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
    @leave.user_id = current_user.id
    @leave.save
    flash[:notice] = 'Leave was successfully Created.'
    respond_with(@leave)
  end

  def update
    @leave.update(leave_params)
    # notify applicant by email
    LeaveMailer::update_status(current_user, @leave.user, @leave).deliver!
    flash[:notice] = 'Leave was successfully Updated.'
    respond_with(@leave, location: ttf_pending_leave_path())
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

  def leave_count
    if params[:start].present? && params[:end].present?
     @leave_days = Leave.total_day(DateTime.parse(params[:start]), DateTime.parse(params[:end]))
      # add new field for day count
    end
  end
  private
    def set_leave
      @leave = Leave.find(params[:id])
    end

    def leave_params
      params.require(:leave).permit(:user_id, :leave_type, :leave_status, :start_date, :end_date, :content)
    end
end
