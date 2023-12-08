class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  normalizes :email, with: ->email { email.strip.downcase }

  # tokens that dont have to be stored in the db, one time use we can use generates_token_for
  # inside block we confirm if old password matches with the password_salt. if it doesnt,
  # the user cant sucessfully reset the password and this token will no longer exists.
  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  # inside block we confirm if its the user's email
  generates_token_for :email_confirmation, expires_in: 24.hours do
    email
  end
end
