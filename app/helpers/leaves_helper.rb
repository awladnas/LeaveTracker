module LeavesHelper

  def get_leaves_by_status(user, status)
    user.leave.where(leave_status: status)
  end
end
