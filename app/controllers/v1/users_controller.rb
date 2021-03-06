class V1::UsersController < ApplicationController
  before_action :authenticate_request!, only: [:show]

  def show
    user = find_user params[:id]

    if user.blank?
      render json: format_response_error(message: Settings.errors.user.email_not_registered), status: :not_found
    else
      user = ActiveModelSerializers::SerializableResource.new(user, {})
      render json: format_response(user: user), status: :ok
      # render json: format_response({user: user, age: 1}) add age to response
    end
  end

  def create
    user = User.new user_params

    if user.save
      render json: format_response(ActiveModelSerializers::SerializableResource.new(user, {}))
    elsif User.find_by(email: user_params[:email]).present?
      render json: format_response_error(message: Settings.errors.user.email_was_registered), status: :bad_request
    else
      render json: format_response_error(user.errors.messages), status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit User::USERS_PARAMS
  end
end
