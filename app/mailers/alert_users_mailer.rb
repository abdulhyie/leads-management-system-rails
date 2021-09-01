class AlertUsersMailer < ApplicationMailer

  def notify_manager(user, phase)
    @user = user
    @phase = phase
    mail(to: @user.email, subject: "A phase has been assigned!")
  end

end
