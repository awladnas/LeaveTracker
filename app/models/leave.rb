class Leave < ActiveRecord::Base
  belongs_to :user
  validates :content, :leave_type,  presence: true

  def total_day

  end
end
