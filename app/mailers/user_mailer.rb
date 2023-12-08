class UserMailer < ApplicationMailer
  def email_confirmation
    mail(to: params[:user].email, subject: "Confirm your account")
  end
end
