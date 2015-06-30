class LeaveMailer < ActionMailer::Base
  default from: "do-not-reply@nascenia.com"

  def new_leave(sender, receiver, leave)
    @receiver = receiver
    @sender = sender
    @leave = leave
    subject = "#{sender.email} applied for leave."
    mail(:to => @receiver.email,:subject => subject) do |format|
      format.html
      format.text
    end
  end

  def update_status(sender, receiver, leave)
    @receiver = receiver
    @sender = sender
    @leave = leave
    subject = "#{sender.email} updated your leave."
    mail(:to => @receiver.email,:subject => subject) do |format|
      format.html
      format.text
    end
  end

  def confirmed_leave(leave)
    @leave = leave
    subject = "Your #{leave.leave_type} leave #{leave.leave_status}."
    mail(:to => leave.user.email,:subject => subject) do |format|
      format.html
      format.text
    end
  end


end
