class AlertUsersMailer < ApplicationMailer

  def notify_manager(user, phase)
    @user = user
    @phase = phase
    mail(to: @user.email, subject: "A phase has been assigned!")
  end

  def notify_engineer(user, phase)
    @user = user
    @phase = phase
    mail(to: @user.email, subject: "You have been added to work on a phase!")
  end

end
