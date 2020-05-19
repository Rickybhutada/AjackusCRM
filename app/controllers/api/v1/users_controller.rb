class Api::V1::UsersController < ApplicationController

  # Create the User and send the welcome email
  def create
    user = User.create(user_params)
    message = user ? SUCCESS_MESSAGE : FAILED_MESSAGE
    UserMailer.welcome_mail(user).deliver
      respond_to do |format|
        format.json { render json: {:success=> message}, status: :ok}
      end
  rescue
    respond_to do |format|
      message = SOMETHING_WENT_WRONG
      format.json { render json: {:success=> message}, status: :unprocessable_entity}
    end
  end

  private
  # Whitlist the user parameter
  def user_params
    params.permit(:first_name, :last_name,:email,:phone,:message)
  end
end
