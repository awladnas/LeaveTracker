module ApplicationHelper
  def get_left_leave_hours type, user
    if type.upcase == 'CASUAL'
      user.total_casual_left
    else
      user.total_sick_left
    end
  end

  def get_consumed_leave_hours type, user
    if type.upcase == 'CASUAL'
      user.total_casual_consume
    else
      user.total_sick_consume
    end
  end

  def is_ttf?(user)
    User.where(:ttf_id => user.id).count
  end

  def ttf_leaves(user)
   return Leave.joins(:user)
             .select('leaves.*')
             .where(:leave_status => 'PENDING' , :users => {:ttf_id => user.id} )
  end
end
