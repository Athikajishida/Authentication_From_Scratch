class User::Account::PasswordResetsController < ApplicationController
  before_action :set_user_by_token, only: [:edit, :update]
  def new # request password reset
  end

  def create # create password reset
    if (user = User.find_by(email: params[:email]))
      PasswordMailer.with(user: user, token: user.generate_token_for(:password_reset)).password_reset.deliver_later
    end

    redirect_to root_path, notice: "Check your email to reset your password"
  end

  def edit
  end

  def update
    if @user.update!(password_params)
      redirect_to login_path, notice: "Your password has been reset succesfully, please log in."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user_by_token
    @user = User.find_by_token_for(:password_reset, params[:token])
    redirect_to new_user_account_password_reset_path alert: "Invalid token, please try again." unless @user.present?
  end
end
