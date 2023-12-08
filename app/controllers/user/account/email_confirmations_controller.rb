class User::Account::EmailConfirmationsController < ApplicationController
  before_action :set_user_by_token, only: [:show]

  def show
    @user.update!(confirm: true)
    redirect_to root_path, notice: "Your account has been confirmed!"
  end

  private

  def set_user_by_token
    @user = User.find_by_token_for(:email_confirmation, params[:token])
    redirect_to root_path alert: "That account could not be confirmed." unless @user.present?
  end
end
