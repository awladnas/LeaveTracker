class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :user_exists, ->(uid, email){where(:uid => uid, :email => email)}
  has_many :leave

  def hours_left(leave_type)
    setting = Setting.all.last
    if leave_type =='SICK'
      self.total_sick_consume.present? ? setting.yearly_sick_leave - self.total_sick_consume : setting.yearly_sick_leave
    else
      self.total_casual_consume.present? ? setting.yearly_casual_leave - self.total_casual_consume : setting.yearly_casual_leave
    end
  end

  def self.from_omniauth(auth)
    require 'securerandom'
    user = user_exists(auth.uid, auth.info.email).first
    if user
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    else
      unless auth.info.email.split("@").last == ENV['DOMAIN']
        return false
      end
      user = User.new
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.urlsafe_base64
    end
    user.save!
    user
  end

end
