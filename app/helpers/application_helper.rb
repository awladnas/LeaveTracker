module ApplicationHelper


  def is_ttf?(user)
    User.where(:supervisor => user.id).count > 0
  end

  def ttf_leaves(user)
   return Leave.joins(:user)
             .select('leaves.*')
             .where(:leave_status => 'PENDING' , :users => {:supervisor => user.id} )
  end
end
