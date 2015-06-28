class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :leave

  def hours_left(leave_type)
    setting = Setting.all.last
    if leave_type =='SICK'
      self.total_sick_consume.present? ? setting.yearly_sick_leave - self.total_sick_consume : setting.yearly_sick_leave
    else
      self.total_casual_consume.present? ? setting.yearly_casual_leave - self.total_casual_consume : setting.yearly_casual_leave
    end
  end
end
