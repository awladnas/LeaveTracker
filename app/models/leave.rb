class Leave < ActiveRecord::Base
  belongs_to :user
  validates :content, :leave_type, presence: true
  validate :check_dates
  after_create :notify_supervisor
  before_create :set_days_minutes

  WEEKS = {
     0 => 'sunday',
     1 => 'monday',
     2 => 'tuesday',
     3 => 'wednesday',
     4 => 'thursday',
     5 => 'friday',
     6 => 'saturday'
  }

  def self.total_day(start_date, end_date)
    total_days_count = 0
    setting = Setting.all.last
    weekend = [setting.weekend_day_one, setting.weekend_day_two]
    while end_date >= start_date
      total_days_count += 1 unless weekend.include?(WEEKS[end_date.wday])
      end_date = end_date - 1.day
    end
    total_days_count
  end

  def check_dates
    errors.add(:start_date, "Must be smaller than end date.") if self.start_date > self.end_date
    errors.add(:start_date, "Leave should be in the future date.") if Date.today > self.start_date
  end

  def notify_supervisor
    # notify ttf and hr
    LeaveMailer::new_leave(self.user, User.find(self.user.supervisor), self).deliver!
  end

  def set_days_minutes
    self.total_days= Leave.total_day(start_date, end_date)
    self.total_minutes= self.total_days.to_i * Setting.last.daily_minutes.to_i
  end
end
